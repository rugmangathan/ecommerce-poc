//
//  SpyableCategoriesView.swift
//  ecommerce-pocTests
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
@testable import ecommerce_poc

class SpyableCategoriesView: CategoriesView {
  func showProgress(_ show: Bool) {}
  func showFetchFailedMessgae(_ show: Bool) {}
}
