//
//  ProductDetailIntentions.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class ProductDetailIntentions {
  private let colorChanges: Observable<String>
  private let sizeChanges: Observable<Int>

  init(_ colorChanges: Observable<String>,
       _ sizeChanges: Observable<Int>) {
    self.colorChanges = colorChanges
    self.sizeChanges = sizeChanges
  }

  func updateColor() -> Observable<String> {
    return colorChanges
  }

  func updateSize() -> Observable<Int> {
    return sizeChanges
  }
}
