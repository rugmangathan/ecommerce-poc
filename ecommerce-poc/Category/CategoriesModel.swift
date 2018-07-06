//
//  CategoriesModel.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift

class CategoriesModel {
  class func bind(_ lifecycle: Observable<MviLifecycle>,
                  _ cachedRepository: CachedRepository) -> Observable<CategoriesState> {
    let initialState = CategoriesState()

    let lifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ in
        return cachedRepository
          .getCategories()
          .map { fetchEvent -> CategoriesState in
            let copiedState = CategoriesState(initialState)
            copiedState.fetchAction = fetchEvent.fetchAction
            copiedState.categories = fetchEvent.result ?? []

            return copiedState
        }
    }

    return lifecycleStates
  }
}
