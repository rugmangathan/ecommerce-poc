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
  var view: MockSpyableCategoriesView!
  var renderer: CategoriesViewRenderer!

  override func setUp() {
    super.setUp()

    view = MockSpyableCategoriesView()
      .withEnabledSuperclassSpy()
    renderer = CategoriesViewRenderer(view)
  }

  func test_renderFetchingState() {
    // Setup
    let state = CategoriesState()

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showProgress(any())
    verify(view, never()).showFetchFailedMessgae(any())
    verify(view, never()).showCategories(any())
    verify(view, never()).showNoCategories(any())
  }

  func test_renderFetchFailedState() {
    // Setup
    let state = CategoriesState(.fetchFailed, [])

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showProgress(any())
    verify(view, times(1)).showFetchFailedMessgae(any())
    verify(view, never()).showCategories(any())
    verify(view, never()).showNoCategories(any())
  }

  func test_renderFetchSuccessfulState() {
    // Setup
    let categories = [
      LocalCategory(1, "Apple", nil)
    ]
    let state = CategoriesState(.fetchSuccessful, categories)

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showProgress(any())
    verify(view, times(1)).showCategories(any())
    verify(view, never()).showFetchFailedMessgae(any())
    verify(view, never()).showNoCategories(any())
  }

  func test_renderNoCatgoriesState() {
    // Setup
    let state = CategoriesState(.fetchSuccessful, [])

    // Events
    renderer.render(state)

    // Verify
    verify(view, times(1)).showProgress(any())
    verify(view, times(1)).showNoCategories(any())
    verify(view, never()).showCategories(any())
    verify(view, never()).showFetchFailedMessgae(any())
  }
}
