//
// Copyright © 2018 Rugmangathan. All rights reserved.
//
// Unauthorized copying of this file, via any medium is strictly prohibited.
// Proprietary and confidential.
//

import UIKit
import McPicker
import RxSwift
import RxCocoa

class ProductsViewController: MviController<ProductsState>, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var categoryButton: UIButton!
  @IBOutlet weak var subCategoryButton: UIButton!
  @IBOutlet weak var orderByButton: UIButton!
  @IBOutlet weak var productsTableView: UITableView!
  @IBOutlet weak var noProductsForundView: UIView!
  @IBOutlet weak var retryButton: UIButton!
  
  var category: LocalCategory!
  private let allCategory = "All"
  var previousState: ProductsState?
  private var products = [Product]() {
    didSet{
      productsTableView.reloadData()
    }
  }
  private let ranks = [Rank.all.rawValue.capitalized,
                       Rank.view.rawValue,
                       Rank.order.rawValue,
                       Rank.share.rawValue]

  private let categoryRelay = PublishRelay<Int>()
  private let subCategoryRelay = PublishRelay<Int>()
  private let orderByRelay = PublishRelay<String>()
  private var subCategories: SubCategoriesDictionary = SubCategoriesDictionary()
  private var categories: CategoriesDictionary = CategoriesDictionary()

  private lazy var repository: LocalRepository = {
    return GrdbRepository(CategoryDao(dbQueue))
  }()

  private lazy var renderer: ProductsViewRenderer = {
    return ProductsViewRenderer(self)
  }()

  private lazy var intentions: ProductsIntentions = {
    return ProductsIntentions(categoryRelay.asObservable(),
                              subCategoryRelay.asObservable(),
                              orderByRelay.asObservable())
  }()

  override func preBind() {
    title = category.name
    _ = disposables
      .insert(ProductsDatasource
        .getCategories(for: category.id, from: repository)
        .subscribe(onNext: { categoriesDictionary in
          self.categories = categoriesDictionary
        }))

    _ = disposables
      .insert(ProductsDatasource
        .getSubCategories(for: category.id, from: repository)
        .subscribe(onNext: { subCategoriesDictionary in
          self.subCategories = subCategoriesDictionary
        }))

    _ = disposables.insert(categoryButton.rx.tap
      .subscribe(onNext: { _ in
        self.categoryTap()
      }))

    _ = disposables.insert(subCategoryButton.rx.tap
      .subscribe(onNext: { _ in
        self.subCategoriesTap()
      }))

    _ = disposables.insert(orderByButton.rx.tap
      .subscribe(onNext: { _ in
        self.orderByTap()
      }))
  }

  override func bind(states: Observable<ProductsState>) -> Observable<ProductsState> {
    return ProductsModel
      .bind(intentions, lifecycle.asObservable(), category.id, states, repository)
  }

  override func effects(state: ProductsState) {
    renderer.render(state)
  }

  @objc private func categoryTap() {
    var displayNames = categories
      .values
      .filter { $0.name != allCategory }
      .sorted { first, second in
        return first.name
          .caseInsensitiveCompare(second.name) == .orderedAscending
      }
      .map { $0.name }

    displayNames.insert(allCategory, at: 0)
    animateAndShowCategories(displayNames)
  }

  @objc private func subCategoriesTap() {
    var sortedSubCategories = subCategories.values
      .filter { $0.name != allCategory }
      .sorted{ first, second in
        return first.name
          .caseInsensitiveCompare(second.name) == .orderedAscending
      }
      .map { $0.name }
    sortedSubCategories.insert(allCategory, at: 0)
    animateAndShowSubCategories(sortedSubCategories)
  }

  @objc private func orderByTap() {
    let selectedIndex: Int = ranks.index(of: orderByButton.title(for: .normal)!)!
    createPickerWith([ranks], selectedIndex)
      .show { selections in
        guard let rank = selections[0] else {
          fatalError("'selections' should not be nil.")
        }

        let selectedRank = self.ranks
          .first { $0 == rank }

        guard let validRank = selectedRank else {
          fatalError("'selectedCategory' should not be nil.")
        }
        self.orderByRelay.accept(validRank)
    }
  }

  private func animateAndShowCategories(_ displayNames: [String]) {
    let selectedIndex: Int = displayNames.index(of: categoryButton.title(for: .normal)!.capitalized)!
    createPickerWith([displayNames], selectedIndex)
      .show { selections in
        guard let category = selections[0] else {
          fatalError("'selections' should not be nil.")
        }

        let selectedCategory = self.categories
          .values
          .first { $0.name == category }

        guard let validCategory = selectedCategory else {
          fatalError("'selectedCategory' should not be nil.")
        }
        self.categoryRelay.accept(validCategory.id)
    }
  }

  private func animateAndShowSubCategories(_ sortedStatuses: [String]) {
    let selectedIndex: Int = sortedStatuses.index(of: subCategoryButton.title(for: .normal)!.capitalized)!
    self.createPickerWith([sortedStatuses], selectedIndex)
      .show { selections in
        guard let subCategory = selections[0] else {
          fatalError("'selections' should not be nil.")
        }
        let selectedSubCategory = self.subCategories
          .values
          .first { $0.name == subCategory }

        guard let validCategory = selectedSubCategory else {
          fatalError("'selectedSubCategory' should not be nil.")
        }
        self.subCategoryRelay.accept(validCategory.id)
    }
  }

  private func createPickerWith(_ data: [[String]], _ selectedIndex: Int) -> McPicker {
    let picker = McPicker(data: data)
    picker.fontSize = 17.0
    picker.pickerBackgroundColor = UIColor.white
    picker.toolbarButtonsColor = UIColor.white
    picker.toolbarItemsFont = UIFont.boldSystemFont(ofSize: 14)
    picker.toolbarBarTintColor = UIColor.darkGray

    let label = UILabel()
    label.textColor = UIColor.lightGray
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    picker.label = label
    picker.pickerSelectRowsForComponents = [0: [selectedIndex: true]]

    return picker
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath)
    cell.textLabel?.text = products[indexPath.row].name
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productDetailView = storyboard?
      .instantiateViewController(withIdentifier: "ProductDetailViewController")
      as! ProductDetailViewController
    productDetailView.product = products[indexPath.row]

    navigationController?.pushViewController(productDetailView, animated: true)
  }
}

extension ProductsViewController: ProductsView {
  func setChildCategories(_ childCategories: [LocalCategory]) {
    var categoriesDictionary = childCategories.reduce(CategoriesDictionary()) { (dictionary, category) in
      var dictionary = dictionary
      dictionary[category.id] = category
      return dictionary
    }
    categoriesDictionary[0] = LocalCategory(0, "All", nil)
    subCategories = categoriesDictionary
    print(subCategoryButton.title(for: .normal))
    if !subCategories.values.contains(where: { $0.name == subCategoryButton.title(for: .normal)! }) {
      subCategoryButton.setTitle(allCategory, for: .normal)
    }
  }

  func setSelectedSubCategory(_ subCategoryKey: Int) {
    categoryButton.setTitle(categories[subCategoryKey]?.name.capitalized, for: .normal)
  }

  func setSelectedChildCategory(_ categoryId: Int) {
    subCategoryButton.setTitle(subCategories[categoryId]?.name.capitalized ?? allCategory, for: .normal)
  }

  func setOrderBy(_ rank: String) {
    orderByButton.setTitle(rank.capitalized, for: .normal)
  }

  func showProgress(_ show: Bool) {
    show
      ? activityIndicator.startAnimating()
      : activityIndicator.stopAnimating()
    activityIndicator.isHidden = !show
  }

  func showProducts(_ products: [Product]) {
    self.products = products
  }

  func showNoProducts(_ show: Bool) {
    noProductsForundView.isHidden = !show
    productsTableView.isHidden = show
  }

  func showRetry(_ show: Bool) {
    retryButton.isHidden = !show
  }

  func showFetchFailedMessage(_ show: Bool) {
    let alertView = UIAlertController(title: "Error",
                                      message: "Something went wrong",
                                      preferredStyle: .alert)
    alertView.addAction(UIAlertAction(title: "Ok", style: .default))
    present(alertView, animated: true)
  }
}
