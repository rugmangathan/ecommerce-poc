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
  func test_screenFetchesCategories_whenVisible() {
    // Setup
    let disposeBag = DisposeBag()
    let lifecycleEvents = PublishRelay<MviLifecycle>()
    let observer = TestScheduler(initialClock: 0)
      .createObserver(CategoriesState.self)
    let cachedRepository = MockCachedRepository()

    let categories = [
      LocalCategory(1, "Electronics", nil),
      LocalCategory(2, "MensWear", nil)
    ]

    CategoriesModel
      .bind(lifecycleEvents.asObservable(), cachedRepository)
      .subscribe(observer)
      .disposed(by: disposeBag)

    stub(cachedRepository) { (repo) in
      when(repo.getCategories())
        .thenReturn(Observable.just((FetchEvent(fetchAction: .fetchSuccessful, result: categories))))
    }

    // Act
    lifecycleEvents.accept(.created)

    //Assert
    let expectedValues = [
      Recorded.next(0, CategoriesState(.fetchSuccessful, categories))
    ]

    XCTAssertEqual(observer.events, expectedValues)
  }
}
