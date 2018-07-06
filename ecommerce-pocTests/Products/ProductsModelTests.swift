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
@testable import ecommerce_poc

class ProductsModelTests: XCTestCase {
  func test_screenFetchesProducts_whenVisible() {
    // Setup
    let disposeBag = DisposeBag()
    let lifecycleEvents = PublishRelay<MviLifecycle>()
    let observer = TestScheduler(initialClock: 0)
      .createObserver(ProductsState.self)
    ProductsModel
      .bind(lifecycleEvents.asObservable())
      .subscribe(observer)
      .disposed(by: disposeBag)

    // Act
    lifecycleEvents.accept(.created)

    //Assert
    let expectedValues = [
      Recorded.next(0, ProductsState()),
      Recorded.next(0, ProductsState())
    ]

    XCTAssertEqual(observer.events, expectedValues)
  }
}
