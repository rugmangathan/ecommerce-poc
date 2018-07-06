//
//  ProductsModel.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class ProductsModel {
  class func bind(_ lifecycle: Observable<MviLifecycle>) -> Observable<ProductsState> {
    return Observable.just(ProductsState())
  }
}
