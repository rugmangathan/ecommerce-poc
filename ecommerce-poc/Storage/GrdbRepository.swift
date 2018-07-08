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
  private lazy var productDao: ProductDao = {
    return ProductDao(dbQueue)
  }()

  init(_ categoryDao: CategoryDao) {
    self.categoryDao = categoryDao
  }
}

extension GrdbRepository: LocalRepository {
  func getCategories() -> Observable<[LocalCategory]> {
    return categoryDao.getCategories()
  }

  func getSubCategories(for categoryId: Int) -> Observable<[LocalCategory]> {
    return categoryDao.getCategories(categoryId)
  }

  func getChildCategories(for categoryId: Int) -> Observable<[LocalCategory]> {
    return categoryDao.getSubCategories(categoryId)
  }

  func getProduts(_ categoryId: Int)-> Observable<[Product]> {
    return productDao.getProducts(with: categoryId)
  }
}
