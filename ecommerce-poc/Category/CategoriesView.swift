//
//  CategoriesView.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 07/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
protocol CategoriesView {
  func showProgress(_ show: Bool)
  func showFetchFailedMessgae(_ show: Bool)
  func showCategories(_ categories: [LocalCategory])
  func showNoCategories(_ show: Bool)
}
