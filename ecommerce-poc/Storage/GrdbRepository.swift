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
    return categoryDao.getParentCategories()
  }

  func getSubCategories(for categoryId: Int) -> Observable<[LocalCategory]> {
    return categoryDao.getSubCategories(categoryId)
  }

  func getChildCategories(for categoryId: Int) -> Observable<[LocalCategory]> {
    return categoryDao.getChildCategories(categoryId)
  }

  func getChildCategories(with subCategoryId: Int) -> Observable<[LocalCategory]> {
    return categoryDao.getSubCategories(subCategoryId)
  }

  func getProduts(_ categoryId: Int)-> Observable<[Product]> {
    return productDao.getProducts(with: categoryId)
  }

  func filterProductsBy(_ category: Int, _ subCategory: Int, _ childCategory: Int, _ orderBy: String) -> Observable<FetchEvent<[Product]>> {
    return productDao
      .fillterProductsBy(
        category,
        subCategory: subCategory,
        childCategory: childCategory,
        orderBy: Rank(rawValue: orderBy)!
      )
      .map { FetchEvent(fetchAction: .inFlight, result: $0) }
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background))
      .observeOn(MainScheduler.instance)
      .asObservable()
  }
}
