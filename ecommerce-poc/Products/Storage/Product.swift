//
//  Product.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxGRDB
import GRDB

class Product: Record {

  struct Column {
    static let id = "id"
    static let name = "name"
    static let taxName = "tax_name"
    static let taxValue = "tax_value"
    static let categoryId = "category_id"
  }

  let id: Int
  let name: String
  let taxName: String
  let taxValue: NSDecimalNumber
  let categoryId: Int

  init(_ id: Int,
       _ name: String,
       _ taxName: String,
       _ taxValue: NSDecimalNumber,
       _ categoryId: Int) {
    self.id = id
    self.name = name
    self.taxName = taxName
    self.taxValue = taxValue
    self.categoryId = categoryId
    super.init()
  }

  override public class var databaseTableName: String {
    return "product"
  }

  required init(row: Row) {
    id = row[Column.id]
    name = row[Column.name]
    taxName = row[Column.taxName]
    let decimalValue = NSDecimalNumber(value: row[Column.taxValue] as Int64)
    taxValue = decimalValue.multiplying(byPowerOf10: -2)
    categoryId = row[Column.categoryId]
    super.init(row: row)
  }

  public override func encode(to container: inout PersistenceContainer) {
    container[Column.id] = id
    container[Column.name] = name
    container[Column.taxName] = taxName
    container[Column.taxValue] = taxValue.multiplying(byPowerOf10: 2).int64Value
    container[Column.categoryId] = categoryId
  }
}

extension Product: Equatable {
  static func == (lhs: Product, rhs: Product) -> Bool {
    return lhs.id == rhs.id
  }
}

extension Product: Hashable {
  public var hashValue: Int {
    return id.hashValue
  }
}
