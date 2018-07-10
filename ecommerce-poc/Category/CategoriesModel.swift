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
                  _ cachedRepository: CachedRepository,
                  _ states: Observable<CategoriesState>) -> Observable<CategoriesState> {
    let initialState = CategoriesState()
    
    let lifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ in
        return cachedRepository.getCategories()
          .map { fetchEvent -> CategoriesState in
            let copiedState = CategoriesState(initialState)
            copiedState.fetchAction = fetchEvent.fetchAction
            copiedState.categories = fetchEvent.result ?? []
            
            return copiedState
        }
    }
    
    let restoredStates = lifecycle
      .filter { $0 == .restored }
      .withLatestFrom(states) { (_, state: CategoriesState) -> CategoriesState in
        return state
      }
      .flatMapLatest { state in
        return cachedRepository.getCategories()
          .flatMapLatest { (fetchEvent) -> Observable<CategoriesState> in
            let copiedState = CategoriesState(state)
            copiedState.fetchAction = fetchEvent.fetchAction
            copiedState.categories = fetchEvent.result ?? []
            
            return Observable.just(copiedState)
        }
    }
    
    return Observable.merge(lifecycleStates, restoredStates)
  }
}
