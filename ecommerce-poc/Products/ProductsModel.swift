//
//  ProductsModel.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class ProductsModel {
  class func bind(_ lifecycle: Observable<MviLifecycle>,
                  _ commonApi: CommonApiProtocol) -> Observable<ProductsState> {
    let initialState = ProductsState()
    let lifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ in
        return commonApi
          .retrieveProducts().flatMapLatest { (response:ProductsResponse) -> Observable<ProductsState> in
            let copiedState = ProductsState(initialState)
            copiedState.fetchAction = .fetchSuccessful
            copiedState.products = response.categories
            return Observable.of(copiedState)
          }
    }
    return lifecycleStates
  }
}
