//
//  Variant.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class Variant: Decodable, Equatable {
  let id: Int
  let color: String
  var size: Int?
  let price: NSDecimalNumber

  init(_ id: Int,
       _ color: String,
       _ size: Int?,
       _ price: NSDecimalNumber) {
    self.id = id
    self.color = color
    self.size = size
    self.price = price
  }

  enum CodingKeys: String, CodingKey {
    case id
    case color
    case size
    case price
  }

  convenience required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let id = try values.decode(Int.self, forKey: .id)
    let color = try values.decode(String.self, forKey: .color)
    let size = try values.decode(Int?.self, forKey: .size)
    let priceDecimalValue = try values.decode(Decimal.self, forKey: .price)
    let price = NSDecimalNumber(decimal: priceDecimalValue)

    self.init(id, color, size, price)
  }

  static func == (lhs: Variant, rhs: Variant) -> Bool {
    return lhs.id == rhs.id
  }
}
