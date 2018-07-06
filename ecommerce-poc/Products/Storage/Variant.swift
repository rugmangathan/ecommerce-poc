//
//  Variant.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import GRDB

class Variant: Record {
  struct Column {
    static let id = "id"
    static let color = "color"
    static let size = "size"
    static let price = "price"
    static let productId = "product_id"
  }

  let id: Int
  let color: String
  let size: Int
  let price: NSDecimalNumber
  let productId: Int

  init(_ id: Int,
       _ color: String,
       _ size: Int,
       _ price: NSDecimalNumber,
       _ productId: Int) {
    self.id = id
    self.color = color
    self.size = size
    self.price = price
    self.productId = productId
    super.init()
  }

  override public class var databaseTableName: String {
    return "variant"
  }

  required init(row: Row) {
    id = row[Column.id]
    color = row[Column.color]
    size = row[Column.size]
    let decimalValue = NSDecimalNumber(value: row[Column.price] as Int64)
    price = decimalValue.multiplying(byPowerOf10: -2)
    productId = row[Column.productId]
    super.init(row: row)
  }

  public override func encode(to container: inout PersistenceContainer) {
    container[Column.id] = id
    container[Column.color] = color
    container[Column.size] = size
    container[Column.price] = price.multiplying(byPowerOf10: 2).int64Value
    container[Column.productId] = productId
  }
}
