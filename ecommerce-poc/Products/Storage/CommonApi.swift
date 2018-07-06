//
//  CommonApi.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

protocol CommonApiProtocol {
  func retrieveProducts() -> Observable<ProductsResponse>
}

class CommonApi {}
