//
//  VariantDao.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift
import GRDB
import RxGRDB

class VariantDao {
  private let dbQueue: DatabaseQueue

  init(_ dbQueue: DatabaseQueue) {
    self.dbQueue = dbQueue
  }

  func insert(_ variant: Variant) {
    do {
      try dbQueue.inDatabase { db in
        try variant.insert(db)
      }
    } catch let error {
      fatalError("Couldn't save the variant: \(error)")
    }
  }

  func insertAll(_ variants: [Variant]) {
    do {
      try dbQueue
        .inDatabase { db in
          for variant in variants {
            _ = try variant.insert(db)
          }
      }
    } catch let error {
      fatalError("Couldn't save the variants: \(error)")
    }
  }

  func getAll() -> Observable<[Variant]> {
    let request = Variant.all()

    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func getVariants(with productId: Int) -> Observable<[Variant]> {
    let request = Variant.filter(Column(Variant.Column.productId) == productId)
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func update(_ variant: Variant) {
    do {
      try dbQueue.inDatabase { db in
        try variant.save(db)
      }
    } catch let error {
      fatalError("Couldn't update the variant: \(error)")
    }
  }

  func delete(_ productId: Int) {
    do {
      try dbQueue.inDatabase { db in
        try db.execute("DELETE FROM \(Variant.databaseTableName) WHERE \(Variant.Column.id) = \(productId)")
      }
    } catch let error {
      fatalError("Couldn't delete the variants: \(error)")
    }
  }
}
