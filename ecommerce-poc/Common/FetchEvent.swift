//
//  FetchEvent.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class FetchEvent<T> {
  let fetchAction: FetchAction
  let result: T?

  init(fetchAction: FetchAction, result: T?) {
    self.fetchAction = fetchAction
    self.result = result
  }
}

enum FetchAction {
  case inFlight
  case fetchFailed
  case fetchSuccessful
}
