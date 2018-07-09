//
//  VariantDiffUtilCallback.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Differ

class VariantDiffUtilCallback {
  let cachedVariants: [Variant]
  let remoteVariants: [Variant]

  typealias CudVariants = (created: [Variant], updated: [Variant], deleted: [Variant])

  private lazy var cud: CudVariants = {
    var duplicateCachedVariants = self.cachedVariants

    let patches = patch(from: cachedVariants, to: remoteVariants)
    var inserts = [Variant]()
    var deletes = [Variant]()
    for patch in patches {
      switch patch {
      case .insertion(let index, let inserted):
        inserts.append(inserted)
        duplicateCachedVariants.insert(inserted, at: index)
      case .deletion(let index):
        deletes.append(duplicateCachedVariants[index])
        duplicateCachedVariants.remove(at: index)
      }
    }
    let insertSet = Set(inserts)
    let deleteSet = Set(deletes)
    let updates = Array(
      Set(cachedVariants)
        .subtracting(insertSet)
        .subtracting(deleteSet)
    )
    return CudVariants(created: inserts, updated: updates, deleted: deletes)
  }()

  init(_ cachedVariants: [Variant], _ remoteVariants: [Variant]) {
    self.cachedVariants = cachedVariants
    self.remoteVariants = remoteVariants
  }

  func newlyInsertedVariants() -> [Variant] {
    return cud.created
  }

  func deletedVariants() -> [Variant] {
    return cud.deleted
  }

  func updatedVariants() -> [Variant] {
    return cud.updated
  }
}
