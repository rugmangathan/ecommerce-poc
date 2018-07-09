//
//  ProductDao.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift
import GRDB
import RxGRDB

class ProductDao {
  private let dbQueue: DatabaseQueue

  init(_ dbQueue: DatabaseQueue) {
    self.dbQueue = dbQueue
  }

  func insert(_ product: Product) {
    do {
      try dbQueue.inDatabase { db in
        try product.insert(db)
      }
    } catch let error {
      fatalError("Couldn't save the product: \(error)")
    }
  }

  func insertAll(_ categories: [Product]) {
    do {
      try dbQueue
        .inDatabase { db in
          for product in categories {
            _ = try product.insert(db)
          }
      }
    } catch let error {
      fatalError("Couldn't save the categories: \(error)")
    }
  }

  func getAll() -> Observable<[Product]> {
    let request = Product.all()

    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func getProducts( with categoryId: Int, orderBy: String?) -> Observable<[Product]> {
    let request = Product.filter(categoryId: categoryId, orderBy)
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func fillterProductsBy(_ categoryId: Int,
                         subCategory: Int,
                         childCategory: Int,
                         orderBy: String?) -> Observable<[Product]> {
    if subCategory == 0 && childCategory == 0{
      return getProducts(with: categoryId, orderBy: orderBy)
    } else if childCategory == 0 {
      let request = Product.filter(subCategoryId: subCategory, orderBy)

      return request
        .rx
        .fetchAll(in: dbQueue)
        .asObservable()
    } else {
      let request = Product.filter(childCategoryId: childCategory, orderBy)
      return request
        .rx
        .fetchAll(in: dbQueue)
        .asObservable()
    }
  }

  func update(_ product: Product) {
    do {
      try dbQueue.inDatabase { db in
        try product.save(db)
      }
    } catch let error {
      fatalError("Couldn't update the product: \(error)")
    }
  }

  func delete(_ productId: Int) {
    do {
      try dbQueue.inDatabase { db in
        try db.execute("DELETE FROM \(Product.databaseTableName) WHERE \(Product.Column.id) = \(productId)")
      }
    } catch let error {
      fatalError("Couldn't delete the categories: \(error)")
    }
  }
}

extension Product {
  static func filter(categoryId: Int, _ rankColumn: String?) -> SQLRequest<Product> {
    var query = "SELECT product.id,  product.category_id, product.name, product.tax_name, product.tax_value FROM product, rank WHERE rank.id = product.id AND product.category_id IN (SELECT c1.id FROM category c1 WHERE c1.parent IN (SELECT c2.id FROM category c2 WHERE c2.parent == ?))"
    if let rankColumn = rankColumn {
      query += " ORDER BY \(rankColumn) DESC"
    }
    return SQLRequest<Product>(
      query,
      arguments: [categoryId])
  }

  static func filter(subCategoryId: Int, _ rankColumn: String?) -> SQLRequest<Product> {
    var query = "SELECT product.id,  product.category_id, product.name, product.tax_name, product.tax_value FROM product, rank WHERE rank.id = product.id AND product.category_id IN (SELECT c1.id FROM category c1 WHERE c1.parent = ?)"
    if let rankColumn = rankColumn {
      query += " ORDER BY \(rankColumn) DESC"
    }
    return SQLRequest<Product>(
      query,
      arguments: [subCategoryId])
  }

  static func filter(childCategoryId: Int, _ rankColumn: String?) -> SQLRequest<Product> {
    var query = "SELECT p.id, p.category_id, p.name, p.tax_name, p.tax_value FROM product p, rank WHERE p.category_id = ? AND rank.id = p.id"
    if let rankColumn = rankColumn {
      query += " ORDER BY \(rankColumn) DESC"
    }
    return SQLRequest<Product>(
      query,
      arguments: [childCategoryId])
  }
}
