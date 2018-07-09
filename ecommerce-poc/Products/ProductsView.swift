//
// Copyright © 2018 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import Foundation

protocol ProductsView {
  var previousState: ProductsState? { get set }
  func setSelectedSubCategory(_ subCategoryKey: Int)
  func setSelectedChildCategory(_ categoryId: Int)
  func setChildCategories(_ childCategories: [LocalCategory])
  func setOrderBy(_ rank: String)

  func showProgress(_ show: Bool)
  func showProducts(_ products: [Product])
  func showNoProducts(_ show: Bool)
  func showRetry(_ show: Bool)
  func showFetchFailedMessage(_ show: Bool)
}
