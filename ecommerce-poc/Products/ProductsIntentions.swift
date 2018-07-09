//
// Copyright © 2018 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import RxSwift

class ProductsIntentions {
  private let categoryChanges: Observable<Int>
  private let subCategoryChanges: Observable<Int>
  private let rankChanges: Observable<String>

  init(_ categoryChanges: Observable<Int>,
       _ subCategoryChanges: Observable<Int>,
       _ rankChanges: Observable<String>) {
    self.categoryChanges = categoryChanges
    self.subCategoryChanges = subCategoryChanges
    self.rankChanges = rankChanges
  }

  func filterByCategory() -> Observable<Int> {
    return categoryChanges
  }

  func filterBySubCategory() -> Observable<Int> {
    return subCategoryChanges
  }

  func orderByRank() -> Observable<String> {
    return rankChanges
  }
}
