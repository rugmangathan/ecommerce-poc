//
// Copyright © 2018 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesViewController: MviController<CategoriesState> {
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

  private var categories = Variable<[LocalCategory]>([])

  override func preBind() {
    categories.asObservable()
      .bind(to: self.categoriesTableView
        .rx
        .items(cellIdentifier: "CategoriesCell")) { (_, category: LocalCategory, cell: UITableViewCell) in
          cell.textLabel?.text = category.name
      }
      .disposed(by: disposeBag)
  }

  override func setup() {
    categoriesTableView.rx.itemSelected
      .subscribe(onNext: { [weak self] indexPath in
        guard let strongSelf = self else { return }
        let productsView = strongSelf
          .storyboard?
          .instantiateViewController(withIdentifier: "ProductsViewController")
          as! ProductsViewController

        productsView.categoryId = strongSelf.categories.value[indexPath.row].id
        strongSelf.navigationController?
          .pushViewController(productsView, animated: true)
      })
  }

  override func bind(states: Observable<CategoriesState>) -> Observable<CategoriesState> {
    return CategoriesModel
      .bind(lifecycle.asObservable(), repository, states)
  }

  override func effects(state: CategoriesState) {
    renderer.render(state)
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
    self.categories.value = categories
  }

  func showNoCategories(_ show: Bool) {
    noCategoriesSuperView.isHidden = !show
    categoriesTableView.isHidden = !show
  }
}
