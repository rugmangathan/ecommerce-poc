//
//  ProductsResponse.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

struct ProductsResponse: Decodable {
  let categories: [RemoteCategory]

  enum CodingKeys: String, CodingKey {
    case categories
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    categories = try values.decode([RemoteCategory].self, forKey: .categories)
  }

  func toCategories() -> [LocalCategory] {
    var localCategories = [LocalCategory]()
    _ = categories.map { remoteCategory in
      let localCategory = LocalCategory(remoteCategory.id, remoteCategory.name, nil)
      localCategories.append(localCategory)
    }

    _ = categories.map { remoteCategory in
      _ = remoteCategory.childCategories.map { childCategoryId in
        localCategories = localCategories.map { category in
          if category.id == childCategoryId {
            category.parent = remoteCategory.id
          }
          return category
        }
      }
    }

    return localCategories
  }
}
