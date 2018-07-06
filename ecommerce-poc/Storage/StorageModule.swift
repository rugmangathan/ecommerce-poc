//
//  StorageModule.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxGRDB
import GRDB

class StorageModule {
  private let dbName = "ecommerce-poc.sqlite"

  private lazy var applicationDocumentsDirectory: URL = {
    do {
      let documentDirectory = try FileManager.default
        .url(for: .documentDirectory,
             in: .userDomainMask,
             appropriateFor: nil,
             create: false)
      return documentDirectory
    } catch let error {
      fatalError("Can't find the documents directory: \(error)")
    }
  }()

  lazy var dbQueue: DatabaseQueue = {
    let path = self.applicationDocumentsDirectory
      .appendingPathComponent(dbName)
      .absoluteString
    do {
      let db = try DatabaseQueue(path: path, configuration: Configuration())
      return db
    } catch let error {
      fatalError("Can't create database queue: \(error)")
    }
  }()

  func setupDatabase() {
    do {
      try dbQueue.write { db in
        try db.create(table: Category.databaseTableName) { t in
          typealias Column = Category.Column
          t.column(Column.id, .integer).primaryKey()
          t.column(Column.name, .text).notNull()
          t.column(Column.parent, .integer)
        }

        try db.create(table: Product.databaseTableName) { t in
          typealias Column = Product.Column
          t.column(Column.id, .integer).primaryKey()
          t.column(Column.name, .text).notNull()
          t.column(Column.taxName, .text).notNull()
          t.column(Column.taxValue, .integer).notNull()
          t.column(Column.categoryId, .integer).notNull()
        }

        try db.create(table: Variant.databaseTableName) { t in
          typealias Column = Variant.Column
          t.column(Column.id, .integer).primaryKey()
          t.column(Column.color, .text).notNull()
          t.column(Column.size, .integer).notNull()
          t.column(Column.price, .integer).notNull()
          t.column(Column.productId, .integer).notNull()
        }
      }
    } catch let error {
      fatalError("Can't write to database: \(error)")
    }
  }
}
