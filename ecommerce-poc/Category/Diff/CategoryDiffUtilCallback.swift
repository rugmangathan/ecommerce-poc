//
//  CategoryDiffUtilCallback.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Differ

class CategoryDiffUtilCallback {
  let cachedCategories: [LocalCategory]
  let remoteCategories: [LocalCategory]

  typealias CudCategories = (created: [LocalCategory], updated: [LocalCategory], deleted: [LocalCategory])

  private lazy var cud: CudCategories = {
    var duplicateCachedCategories = self.cachedCategories

    let patches = patch(from: cachedCategories, to: remoteCategories)
    var inserts = [LocalCategory]()
    var deletes = [LocalCategory]()
    for patch in patches {
      switch patch {
      case .insertion(let index, let inserted):
        inserts.append(inserted)
        duplicateCachedCategories.insert(inserted, at: index)
      case .deletion(let index):
        deletes.append(duplicateCachedCategories[index])
        duplicateCachedCategories.remove(at: index)
      }
    }
    let insertSet = Set(inserts)
    let deleteSet = Set(deletes)
    let updates = Array(
      Set(cachedCategories)
        .subtracting(insertSet)
        .subtracting(deleteSet)
    )
    return CudCategories(created: inserts, updated: updates, deleted: deletes)
  }()

  init(_ cachedCategories: [LocalCategory], _ remoteCategories: [LocalCategory]) {
    self.cachedCategories = cachedCategories
    self.remoteCategories = remoteCategories
  }

  func newlyInsertedCategories() -> [LocalCategory] {
    return cud.created
  }

  func deletedCategotries() -> [LocalCategory] {
    return cud.deleted
  }

  func updatedCategories() -> [LocalCategory] {
    return cud.updated
  }
}
