//
//  ProductsState.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class ProductsState: Equatable {
  var fetchAction: FetchAction
  var products: [Product]

  init(_ fetchAction: FetchAction = .inFlight,
       _ products: [Product] = []) {
    self.fetchAction = fetchAction
    self.products = products
  }

  required init(_ state: ProductsState) {
    self.fetchAction = state.fetchAction
    self.products = state.products
  }

  static func ==(lhs: ProductsState, rhs: ProductsState) -> Bool {
    return lhs.fetchAction == rhs.fetchAction && lhs.products == rhs.products
  }
}
