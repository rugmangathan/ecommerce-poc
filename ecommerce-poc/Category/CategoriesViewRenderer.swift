//
//  CategoriesViewRenderer.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class CategoriesViewRenderer {
  let view: CategoriesView

  init(_ view: CategoriesView) {
    self.view = view
  }

  func render(_ state: CategoriesState) {
    switch state.fetchAction {
    case .inFlight:
      view.showProgress(true)
    case .fetchFailed:
      view.showProgress(false)
      view.showFetchFailedMessgae(true)
    case .fetchSuccessful:
      view.showProgress(false)
      view.showCategories(state.categories)
    }
  }
}
