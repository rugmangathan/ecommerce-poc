//
//  ProductDetailModel.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class ProductDetailModel {
  class func bind(_ intentions: ProductDetailIntentions,
                  _ lifecycle: Observable<MviLifecycle>,
                  _ productId: Int,
                  _ repository: LocalRepository) -> Observable<ProductDetailState> {
    let initialState = ProductDetailState()

    let lifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ in
        repository.getVariants(for: productId)
          .flatMapLatest { variants -> Observable<ProductDetailState> in
            let copiedState = ProductDetailState(initialState)
            copiedState.fetchAction = .fetchSuccessful
            copiedState.variants = variants
            return Observable.just(copiedState)
        }
    }

    return lifecycleStates
  }
}
