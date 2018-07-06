//
//  ProductsModelTests.swift
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

class ProductsModelTests: XCTestCase {
  func test_screenFetchesProducts_whenVisible() {
    // Setup
    let disposeBag = DisposeBag()
    let lifecycleEvents = PublishRelay<MviLifecycle>()
    let observer = TestScheduler(initialClock: 0)
      .createObserver(ProductsState.self)
    let commonApi = MockCommonApi()

    let variants = [
      RemoteVariant(1, "Red", 14, NSDecimalNumber(value: 1200))
    ]

    let products = [
      RemoteProduct(1, "Apple iPod", Date(), variants, "VAT", NSDecimalNumber(value: 12.5))
    ]

    let categories = [
      RemoteCategory(1, "Apple", products, [])
    ]

    ProductsModel
      .bind(lifecycleEvents.asObservable(), commonApi)
      .subscribe(observer)
      .disposed(by: disposeBag)

    stub(commonApi) { (commonApi) in
      when(commonApi.retrieveProducts())
        .thenReturn(Observable.just(ProductsResponse(categories: categories)))
    }

    // Act
    lifecycleEvents.accept(.created)

    //Assert
    let expectedValues = [
      Recorded.next(0, ProductsState(.fetchSuccessful, categories))
    ]

    XCTAssertEqual(observer.events, expectedValues)
  }
}
