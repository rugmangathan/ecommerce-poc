//
//  Category.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

class Category: Decodable, Equatable {
  var id: Int
  var name: String
  var products: [Product]
  var childCategories: [Int]

  init(_ id: Int,
       _ name: String,
       _ products: [Product],
       _ childCategories: [Int]) {
    self.id = id
    self.name = name
    self.products = products
    self.childCategories = childCategories
  }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case products
    case childCategories = "child_categories"
  }

  convenience required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let id = try values.decode(Int.self, forKey: .id)
    let name = try values.decode(String.self, forKey: .name)
    let products = try values.decode([Product].self, forKey: .products)
    let childCategories = try values.decode([Int].self, forKey: .childCategories)

    self.init(id, name, products, childCategories)
  }

  static func == (lhs: Category, rhs: Category) -> Bool {
    return lhs.id == rhs.id
  }
}
