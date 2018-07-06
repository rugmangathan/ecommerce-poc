//
//  GrdbRepository.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class GrdbRepository {
  private let categoryDao: CategoryDao

  init(_ categoryDao: CategoryDao) {
    self.categoryDao = categoryDao
  }
}

extension GrdbRepository: LocalRepository {
  func getCategories() -> Observable<[LocalCategory]> {
    return categoryDao.getAll()
  }
}
