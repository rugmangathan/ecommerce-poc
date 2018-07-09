//
//  ProductDetailState.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

class ProductDetailState: MviState {
  var fetchAction: FetchAction
  var variants: [Variant]

  init(_ fetchAction: FetchAction = .inFlight,
       _ variants: [Variant] = []) {
    self.fetchAction = fetchAction
    self.variants = variants
  }

  required init(_ state: ProductDetailState) {
    self.fetchAction = state.fetchAction
    self.variants = state.variants
  }

  static func ==(lhs: ProductDetailState, rhs: ProductDetailState) -> Bool {
    return lhs.fetchAction == rhs.fetchAction && lhs.variants == rhs.variants
  }
}
