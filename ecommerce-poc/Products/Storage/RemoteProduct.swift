//
//  RemoteProduct.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class RemoteProduct: Decodable, Equatable {
  var id: Int
  var name: String
  var dateAdded: Date
  var variants: [RemoteVariant]
  var taxName: String
  var taxValue: NSDecimalNumber

  init(_ id: Int,
       _ name: String,
       _ dateAdded: Date,
       _ variants: [RemoteVariant],
       _ taxName: String,
       _ taxValue: NSDecimalNumber) {
    self.id = id
    self.name = name
    self.dateAdded = dateAdded
    self.variants = variants
    self.taxName = taxName
    self.taxValue = taxValue
  }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case dateAdded = "date_added"
    case variants
    case tax
  }

  enum TaxKeys: String, CodingKey {
    case name
    case value
  }

  convenience required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let id = try values.decode(Int.self, forKey: .id)
    let name = try values.decode(String.self, forKey: .name)
    let dateAdded = try values.decode(Date.self, forKey: .dateAdded)
    let variants = try values.decode([RemoteVariant].self, forKey: .variants)
    let tax = try values.nestedContainer(keyedBy: TaxKeys.self, forKey: .tax)
    let taxName = try tax.decode(String.self, forKey: .name)
    let taxDecimalValue = try tax.decode(Decimal.self, forKey: .value)
    let taxValue = NSDecimalNumber(decimal: taxDecimalValue)

    self.init(id, name, dateAdded, variants, taxName, taxValue)
  }

  static func == (lhs: RemoteProduct, rhs: RemoteProduct) -> Bool {
    return lhs.id == rhs.id
  }
}
