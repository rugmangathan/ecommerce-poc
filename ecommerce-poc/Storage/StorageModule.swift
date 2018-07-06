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
      }
    } catch let error {
      fatalError("Can't write to database: \(error)")
    }
  }
}
