//
//  ProductsDatasource.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

typealias SubCategoriesDictionary = [Int: LocalCategory]
typealias CategoriesDictionary = [Int: LocalCategory]

class ProductsDatasource {
  class func getCategories(for categoryId: Int, from localRepository: LocalRepository) -> Observable<CategoriesDictionary> {
    return localRepository
      .getSubCategories(for: categoryId)
      .map { categories -> CategoriesDictionary in
        var categoriesDictionary = categories.reduce(CategoriesDictionary()) { (dictionary, category) in
          var dictionary = dictionary
          dictionary[category.id] = category
          return dictionary
        }
        categoriesDictionary[0] = LocalCategory(0, "All", nil)
        return categoriesDictionary
    }
  }

  class func getSubCategories(for categoryId: Int, from localRepository: LocalRepository) -> Observable<SubCategoriesDictionary> {
    return localRepository
      .getChildCategories(for: categoryId)
      .map { categories -> CategoriesDictionary in
        var categoriesDictionary = categories.reduce(CategoriesDictionary()) { (dictionary, category) in
          var dictionary = dictionary
          dictionary[category.id] = category
          return dictionary
        }
        categoriesDictionary[0] = LocalCategory(0, "All", nil)
        return categoriesDictionary
    }
  }
}
