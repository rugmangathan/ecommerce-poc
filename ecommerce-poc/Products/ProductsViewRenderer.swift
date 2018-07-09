//
//  ProductsViewRenderer.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class ProductsViewRenderer {
  var view: ProductsView

  init(_ view: ProductsView) {
    self.view = view
  }

  func render(_ state: ProductsState) {
    switch state.fetchAction {
    case .inFlight:
      if view.previousState?.fetchAction == .fetchFailed {
        view.showRetry(false)
        view.showFetchFailedMessage(false)
      }
      view.showProgress(true)
    case .fetchFailed:
      view.showProgress(false)
      view.showNoProducts(true)
      view.showFetchFailedMessage(true)
    case .fetchSuccessful:
      view.showProgress(false)
      if !state.products.isEmpty {
        view.showProducts(state.products)
      } else {
        view.showNoProducts(true)
      }
    }

    view.setSelectedSubCategory(state.subCategoryId)
    view.setSelectedChildCategory(state.childCategoryId)
    view.setChildCategories(state.childCategories)
    view.setOrderBy(state.orderBy)

    view.previousState = state
  }
}
