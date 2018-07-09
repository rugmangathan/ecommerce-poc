//
// Copyright © 2018 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesViewController: MviController<CategoriesState>, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  @IBOutlet weak var categoriesTableView: UITableView!
  @IBOutlet weak var noCategoriesSuperView: UIView!
  @IBOutlet weak var retryButton: UIButton!

  private let disposeBag = DisposeBag()

  private lazy var commonApi: CommonApiProtocol = {
    return CommonApi()
  }()

  private lazy var repository: CachedRepository = {
    let categoryDao = CategoryDao(dbQueue)
    return MasterRepository(categoryDao,
                            ProductDao(dbQueue),
                            commonApi)
  }()

  private lazy var renderer: CategoriesViewRenderer = {
    return CategoriesViewRenderer(self)
  }()

  private var categories = [LocalCategory]() {
    didSet {
      categoriesTableView.reloadData()
    }
  }

  override func bind(states: Observable<CategoriesState>) -> Observable<CategoriesState> {
    return CategoriesModel
      .bind(lifecycle.asObservable(), repository, states)
  }

  override func effects(state: CategoriesState) {
    renderer.render(state)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath)
    cell.textLabel?.text = categories[indexPath.row].name

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productsView = storyboard?
      .instantiateViewController(withIdentifier: "ProductsViewController")
      as! ProductsViewController

    productsView.category = categories[indexPath.row]
    navigationController?.pushViewController(productsView, animated: true)
  }
}


extension CategoriesViewController: CategoriesView {
  func showProgress(_ show: Bool) {
    loadingIndicator.isHidden = !show
    show
      ? loadingIndicator.startAnimating()
      : loadingIndicator.stopAnimating()
  }

  func showFetchFailedMessgae(_ show: Bool) {
    let alertView = UIAlertController(title: "Error",
                                      message: "Something went wrong",
                                      preferredStyle: .alert)
    alertView.addAction(UIAlertAction(title: "Ok", style: .default))
    present(alertView, animated: true)
  }

  func showCategories(_ categories: [LocalCategory]) {
    noCategoriesSuperView.isHidden = true
    categoriesTableView.isHidden = false
    self.categories = categories
  }

  func showNoCategories(_ show: Bool) {
    noCategoriesSuperView.isHidden = !show
    categoriesTableView.isHidden = !show
  }
}
