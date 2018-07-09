//
//  CategoriesModelTests.swift
//  ecommerce-pocTests
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import Cuckoo
@testable import ecommerce_poc

class CategoriesModelTests: XCTestCase {

  var disposeBag: DisposeBag!
  var lifecycleEvents: PublishRelay<MviLifecycle>!
  var stateRelay: PublishRelay<CategoriesState>!
  var observer: TestableObserver<CategoriesState>!
  var cachedRepository: MockCachedRepository!

  var categories: [LocalCategory]!
  private let initialState = CategoriesState()

  override func setUp() {
    super.setUp()

    disposeBag = DisposeBag()
    lifecycleEvents = PublishRelay<MviLifecycle>()
    stateRelay = PublishRelay<CategoriesState>()
    observer = TestScheduler(initialClock: 0)
      .createObserver(CategoriesState.self)
    cachedRepository = MockCachedRepository()

    categories = [
      LocalCategory(1, "Electronics", nil),
      LocalCategory(2, "MensWear", nil)
    ]
  }

  func test_screenFetchesCategories_whenVisible() {
    // Setup
    stub(cachedRepository) { (repo) in
      when(repo.getCategories())
        .thenReturn(Observable.just((FetchEvent(fetchAction: .fetchSuccessful, result: categories))))
    }

    CategoriesModel
      .bind(lifecycleEvents.asObservable(), cachedRepository, stateRelay.asObservable())
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Act
    lifecycleEvents.accept(.created)
    stateRelay.accept(initialState)

    //Assert
    let expectedValues = [
      Recorded.next(0, CategoriesState(.fetchSuccessful, categories))
    ]

    XCTAssertEqual(observer.events, expectedValues)
  }

  func test_showNoRecords_whenBothCacheAndRemoteFails() {
    // Setup
    stub(cachedRepository) { (repo) in
      when(repo.getCategories())
        .thenReturn(Observable.just((FetchEvent(fetchAction: .fetchFailed, result: nil))))
    }

    CategoriesModel
      .bind(lifecycleEvents.asObservable(), cachedRepository, stateRelay.asObservable())
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Act
    lifecycleEvents.accept(.created)
    stateRelay.accept(initialState)

    //Assert
    let expectedValues = [
      Recorded.next(0, CategoriesState(.fetchFailed, []))
    ]

    XCTAssertEqual(observer.events, expectedValues)
  }
}
