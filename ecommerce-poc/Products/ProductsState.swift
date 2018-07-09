//
//  ProductsState.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class ProductsState: MviState {
  var fetchAction: FetchAction
  var products: [Product]
  var subCategoryId: Int
  var childCategoryId: Int
  var orderBy: String
  var childCategories: [LocalCategory]

  init(_ fetchAction: FetchAction = .inFlight,
       _ products: [Product] = [],
       _ subCategoryId: Int = 0,
       _ childCategoryId: Int = 0,
       _ orderBy: String = Rank.all.rawValue,
       childCategories: [LocalCategory]) {
    self.fetchAction = fetchAction
    self.products = products
    self.subCategoryId = subCategoryId
    self.childCategoryId = childCategoryId
    self.orderBy = orderBy
    self.childCategories = childCategories
  }

  required init(_ state: ProductsState) {
    self.fetchAction = state.fetchAction
    self.products = state.products
    self.subCategoryId = state.subCategoryId
    self.childCategoryId = state.childCategoryId
    self.orderBy = state.orderBy
    self.childCategories = state.childCategories
  }

  static func ==(lhs: ProductsState, rhs: ProductsState) -> Bool {
    return lhs.fetchAction == rhs.fetchAction && lhs.products == rhs.products
  }
}
