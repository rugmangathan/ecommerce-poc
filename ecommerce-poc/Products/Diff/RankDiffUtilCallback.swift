//
//  RankDiffUtilCallback.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Differ

class RankDiffUtilCallback {
  let cachedRanks: [LocalRank]
  let remoteRanks: [LocalRank]

  typealias CudRanks = (created: [LocalRank], updated: [LocalRank], deleted: [LocalRank])

  private lazy var cud: CudRanks = {
    var duplicateCachedRanks = self.cachedRanks

    let patches = patch(from: cachedRanks, to: remoteRanks)
    var inserts = [LocalRank]()
    var deletes = [LocalRank]()
    for patch in patches {
      switch patch {
      case .insertion(let index, let inserted):
        inserts.append(inserted)
        duplicateCachedRanks.insert(inserted, at: index)
      case .deletion(let index):
        deletes.append(duplicateCachedRanks[index])
        duplicateCachedRanks.remove(at: index)
      }
    }
    let insertSet = Set(inserts)
    let deleteSet = Set(deletes)
    let updates = Array(
      Set(cachedRanks)
        .subtracting(insertSet)
        .subtracting(deleteSet)
    )
    return CudRanks(created: inserts, updated: updates, deleted: deletes)
  }()

  init(_ cachedRanks: [LocalRank], _ remoteRanks: [LocalRank]) {
    self.cachedRanks = cachedRanks
    self.remoteRanks = remoteRanks
  }

  func newlyInsertedRanks() -> [LocalRank] {
    return cud.created
  }

  func deletedRanks() -> [LocalRank] {
    return cud.deleted
  }

  func updatedRanks() -> [LocalRank] {
    return cud.updated
  }
}
