//
//  CategoriesViewTests.swift
//  ecommerce-pocTests
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import XCTest
import Cuckoo
@testable import ecommerce_poc

class CategoriesViewTests: XCTestCase {
  func test_renderFetchingState() {
    // Setup
    let view = MockSpyableCategoriesView()
      .withEnabledSuperclassSpy()
    let renderer = CategoriesViewRenderer(view)
    let state = CategoriesState()

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showProgress(any())
    verify(view, never()).showFetchFailedMessgae(any())
  }

  func test_renderFetchFailedState() {
    // Setup
    let view = MockSpyableCategoriesView()
      .withEnabledSuperclassSpy()
    let renderer = CategoriesViewRenderer(view)
    let state = CategoriesState(.fetchFailed, [])

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showFetchFailedMessgae(any())
    verify(view, never()).showProgress(any())
  }
}
