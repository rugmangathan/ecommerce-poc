//
//  ProductsResponse.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class ProductsResponse: Decodable {
  let categories: [RemoteCategory]

  init(_ categories: [RemoteCategory]) {
    self.categories = categories
  }
}
