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

  func getProducts( with categoryId: Int) -> Observable<[Product]> {
    let request = Product.filter(categoryId: categoryId)
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func fillterProductsBy(_ categoryId: Int,
                         subCategory: Int,
                         childCategory: Int,
                         orderBy: Rank) -> Observable<[Product]> {
    if subCategory == 0 && childCategory == 0{
      return getProducts(with: categoryId)
    } else if childCategory == 0 {
      let request = Product.filter(subCategoryId: subCategory)
      return request
        .rx
        .fetchAll(in: dbQueue)
        .asObservable()
    } else {
      let request = Product.filter(Column(Product.Column.categoryId) == childCategory)
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
  static func filter(categoryId: Int) -> SQLRequest<Product> {
    return SQLRequest<Product>(
      "SELECT * FROM product WHERE product.category_id IN (SELECT c1.id FROM category c1 WHERE c1.parent IN (SELECT c2.id FROM category c2 WHERE c2.parent == ?))",
      arguments: [categoryId])
  }

  static func filter(subCategoryId: Int) -> SQLRequest<Product> {
    return SQLRequest<Product>(
      "SELECT * FROM product WHERE product.category_id IN (SELECT c1.id FROM category c1 WHERE c1.parent = ?)",
      arguments: [subCategoryId])
  }
}
