//
//  CategoriesState.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class CategoriesState: MviState {
  var fetchAction: FetchAction
  var categories: [LocalCategory]

  init(_ fetchAction: FetchAction = .inFlight,
       _ categories: [LocalCategory] = []) {
    self.fetchAction = fetchAction
    self.categories = categories
  }

  required init(_ state: CategoriesState) {
    self.fetchAction = state.fetchAction
    self.categories = state.categories
  }

  static func ==(lhs: CategoriesState, rhs: CategoriesState) -> Bool {
    return lhs.fetchAction == rhs.fetchAction
      && lhs.categories == rhs.categories
  }
}
