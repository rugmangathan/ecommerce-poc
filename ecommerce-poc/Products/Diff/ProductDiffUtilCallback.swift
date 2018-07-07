//
//  ProductDiffUtilCallback.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Differ

class ProductDiffUtilCallback {
  let cachedProducts: [Product]
  let remoteProducts: [Product]

  typealias CudProducts = (created: [Product], updated: [Product], deleted: [Product])

  private lazy var cud: CudProducts = {
    var duplicateCachedProducts = self.cachedProducts

    let patches = patch(from: cachedProducts, to: remoteProducts)
    var inserts = [Product]()
    var deletes = [Product]()
    for patch in patches {
      switch patch {
      case .insertion(let index, let inserted):
        inserts.append(inserted)
        duplicateCachedProducts.insert(inserted, at: index)
      case .deletion(let index):
        deletes.append(duplicateCachedProducts[index])
        duplicateCachedProducts.remove(at: index)
      }
    }
    let insertSet = Set(inserts)
    let deleteSet = Set(deletes)
    let updates = Array(
      Set(cachedProducts)
        .subtracting(insertSet)
        .subtracting(deleteSet)
    )
    return CudProducts(created: inserts, updated: updates, deleted: deletes)
  }()

  init(_ cachedProducts: [Product], _ remoteProducts: [Product]) {
    self.cachedProducts = cachedProducts
    self.remoteProducts = remoteProducts
  }

  func newlyInsertedCategories() -> [Product] {
    return cud.created
  }

  func deletedCategotries() -> [Product] {
    return cud.deleted
  }

  func updatedCategories() -> [Product] {
    return cud.updated
  }
}
