//
//  MasterRepository.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift
import RxBlocking

class MasterRepository {
  let categoryDao: CategoryDao
  let commonApi: CommonApiProtocol

  init(_ categoryDao: CategoryDao,
       _ commonApi: CommonApiProtocol) {
    self.categoryDao = categoryDao
    self.commonApi = commonApi
  }
}

extension MasterRepository: CachedRepository {
  func getCategories() -> Observable<FetchEvent<[LocalCategory]>> {
    let cacheFetches = categoryDao.getCategories()
      .map { FetchEvent(fetchAction: .inFlight, result: $0.isEmpty ? nil : $0) }
      .asObservable()
    let networkFetches = commonApi
      .retrieveProducts()
      .flatMapLatest { categoriesResponse -> Observable<FetchEvent<[LocalCategory]>> in
        let categories = categoriesResponse.toCategories().sorted(by: { $0.id < $1.id })
        return self.diffAndUpdateCachedCategories(categories)
          .flatMapLatest { _ in
            self.categoryDao
              .getCategories()
          }
          .map { FetchEvent(fetchAction: .fetchSuccessful, result: $0) }
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background))
    }
    .catchErrorJustReturn(FetchEvent(fetchAction: .fetchFailed, result: nil))

    do {
      let cacheFetchEvent = try cacheFetches
        .toBlocking()
        .first()!

      return Observable
        .concat(Observable.just(cacheFetchEvent), networkFetches)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background))
        .observeOn(MainScheduler.instance)
    } catch let error {
      fatalError("fetching categories status \(error.localizedDescription)")
    }
  }

  func getProducts() -> Observable<FetchEvent<[RemoteCategory]>> {
    return Observable.just(FetchEvent(fetchAction: .fetchFailed, result: nil))
  }

  private func diffAndUpdateCachedCategories(_ remoteCategories: [LocalCategory]) -> Observable<[LocalCategory]> {
    do {
      let cachedCategories = try categoryDao
        .getAll()
        .toBlocking()
        .first()!

      let diffCallback = CategoryDiffUtilCallback(cachedCategories, remoteCategories)
      let newCategories = diffCallback.newlyInsertedCategories()
      let deletedTransactions = diffCallback.deletedCategotries()
      let updatedCategories = diffCallback.updatedCategories()

      if !newCategories.isEmpty {
        categoryDao.insertAll(newCategories)
      }

      _ = updatedCategories.map { categoryDao.update($0) }
      _ = deletedTransactions.map { categoryDao.delete($0.id) }

      return categoryDao.getCategories()
    } catch let error {
      fatalError("Diff and update categories to db failed \(error.localizedDescription)")
    }
  }
}
