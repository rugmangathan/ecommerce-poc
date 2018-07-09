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
  let rankings: [Ranking]

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

  func toProducts() -> [Product] {
    var products = [Product]()
    _ = categories.map { remoteCategory in
      _ = remoteCategory.products.map { product in
        let localProduct = Product(product.id,
                                   product.name,
                                   product.taxName,
                                   product.taxValue,
                                   remoteCategory.id)
        products.append(localProduct)
      }
    }
    return products
  }

  func toVariants() -> [Variant] {
    var variants = [Variant]()
    _ = categories.map { category in
      _ = category.products.map { product in
        _ = product.variants.map { variant in
          let localVariant = Variant(variant.id,
                                variant.color,
                                variant.size,
                                variant.price,
                                product.id)
          variants.append(localVariant)
        }
      }
    }
    return variants
  }
}
