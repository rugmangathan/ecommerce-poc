//
//  CategoryDao.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift
import RxGRDB
import GRDB

class CategoryDao {
  private let dbQueue: DatabaseQueue

  init(_ dbQueue: DatabaseQueue) {
    self.dbQueue = dbQueue
  }

  func insert(_ category: LocalCategory) {
    do {
      try dbQueue.inDatabase { db in
        try category.insert(db)
      }
    } catch let error {
      fatalError("Couldn't save the category: \(error)")
    }
  }

  func insertAll(_ categories: [LocalCategory]) {
    do {
      try dbQueue
        .inDatabase { db in
          for category in categories {
            _ = try category.insert(db)
          }
      }
    } catch let error {
      fatalError("Couldn't save the categories: \(error)")
    }
  }

  func getAll() -> Observable<[LocalCategory]> {
    let request = LocalCategory.all()

    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func getCategories() -> Observable<[LocalCategory]> {
    let request = LocalCategory.filter(Column(LocalCategory.Column.parent) == nil)
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func update(_ category: LocalCategory) {
    do {
      try dbQueue.inDatabase { db in
        try category.save(db)
      }
    } catch let error {
      fatalError("Couldn't update the category: \(error)")
    }
  }

  func delete(_ categoryId: Int) {
    do {
      try dbQueue.inDatabase { db in
        try db.execute("DELETE FROM \(LocalCategory.databaseTableName) WHERE \(LocalCategory.Column.id) = \(categoryId)")
      }
    } catch let error {
      fatalError("Couldn't delete the categories: \(error)")
    }
  }

  func getCategories(_ categoryId: Int) -> Observable<[LocalCategory]> {
    let request = LocalCategory.filter(Column(LocalCategory.Column.parent) == categoryId)

    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func getSubCategories(_ categoryId: Int) -> Observable<[LocalCategory]> {
    let request = LocalCategory.filter(categoryId: categoryId)
    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }
}

extension LocalCategory {
  static func filter(categoryId: Int) -> SQLRequest<LocalCategory> {
    return SQLRequest<LocalCategory>(
      "SELECT DISTINCT c1.id, c1.name FROM category c1 WHERE c1.id IN (SELECT c2.id FROM category c2 WHERE c2.parent IN (SELECT c3.id FROM category c3 WHERE c3.parent == ?)) ORDER BY c1.name",
      arguments: [categoryId])
  }
}
