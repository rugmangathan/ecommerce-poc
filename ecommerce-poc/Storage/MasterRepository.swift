//
//  MasterRepository.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift

class MasterRepository {
  let categoryDao: CategoryDao
  let commonApi: CommonApiProtocol

  init(_ categoryDao: CategoryDao,
       _ commonApi: CommonApiProtocol) {
    self.categoryDao = categoryDao
    self.commonApi = commonApi
  }
}

