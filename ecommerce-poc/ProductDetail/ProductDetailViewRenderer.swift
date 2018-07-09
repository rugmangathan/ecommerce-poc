//
//  ProductDetailViewRenderer.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class ProductDetailViewRenderer {
  private let view: ProductDetailView

  init(_ view: ProductDetailView) {
    self.view = view
  }

  func render(state: ProductDetailState) {
    switch state.fetchAction {
    case .inFlight:
      view.showProgress(true)
    case .fetchFailed:
      view.showProgress(false)
      view.showFetchFailedMesssage()
    case .fetchSuccessful:
      view.showProgress(false)
      view.showVariants(state.variants)
    }
  }
}
