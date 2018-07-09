//
//  ProductDetailView.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

protocol ProductDetailView {
  func showVariants(_ variants: [Variant])
  func showProgress(_ show: Bool)
  func showFetchFailedMesssage()
}
