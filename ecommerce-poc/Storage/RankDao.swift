//
//  RankDao.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift
import RxGRDB
import GRDB

class RankDao {
  private let dbQueue: DatabaseQueue

  init(_ dbQueue: DatabaseQueue) {
    self.dbQueue = dbQueue
  }

  func insert(_ rank: LocalRank) {
    do {
      try dbQueue.inDatabase { db in
        try rank.insert(db)
      }
    } catch let error {
      fatalError("Couldn't save the rank: \(error)")
    }
  }

  func insertAll(_ ranks: [LocalRank]) {
    do {
      try dbQueue
        .inDatabase { db in
          for rank in ranks {
            _ = try rank.insert(db)
          }
      }
    } catch let error {
      fatalError("Couldn't save the ranks: \(error)")
    }
  }

  func getAll() -> Observable<[LocalRank]> {
    let request = LocalRank.all()

    return request.rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func getVariants(with productId: Int) -> Observable<[LocalRank]> {
    let request = LocalRank.filter(Column(LocalRank.Column.id) == productId)
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }

  func update(_ rank: LocalRank) {
    do {
      try dbQueue.inDatabase { db in
        try rank.save(db)
      }
    } catch let error {
      fatalError("Couldn't update the rank: \(error)")
    }
  }

  func delete(_ id: Int) {
    do {
      try dbQueue.inDatabase { db in
        try db.execute("DELETE FROM \(LocalRank.databaseTableName) WHERE \(LocalRank.Column.id) = \(id)")
      }
    } catch let error {
      fatalError("Couldn't delete the ranks: \(error)")
    }
  }
}
