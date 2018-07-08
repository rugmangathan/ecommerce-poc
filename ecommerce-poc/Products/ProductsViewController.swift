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

class ProductsCell: UITableViewCell {
  
}

class ProductsViewController: MviController<ProductsState> {
  @IBOutlet weak var categoryButton: UIButton!
  @IBOutlet weak var subCategoryButton: UIButton!
  @IBOutlet weak var orderByButton: UIButton!
  
  var categoryId: Int!
  private let allCategory = "All"

  private let categoryRelay = PublishRelay<Int>()
  private let subCategoryRelay = PublishRelay<Int>()
  private var subCategories: SubCategoriesDictionary = SubCategoriesDictionary()
  private var categories: CategoriesDictionary = CategoriesDictionary()
  private lazy var repository: LocalRepository = {
    return GrdbRepository(CategoryDao(dbQueue))
  }()

  private lazy var renderer: ProductsViewRenderer = {
    return ProductsViewRenderer(self)
  }()

  override func preBind() {
    _ = disposables
      .insert(ProductsDatasource
        .getCategories(for: categoryId, from: repository)
        .subscribe(onNext: { categoriesDictionary in
          self.categories = categoriesDictionary
        }))

    _ = disposables
      .insert(ProductsDatasource
        .getSubCategories(for: categoryId, from: repository)
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
  }

  override func bind(states: Observable<ProductsState>) -> Observable<ProductsState> {
    return ProductsModel
      .bind(lifecycle.asObservable(), categoryId, repository)
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
    animateAndShowCategoris(displayNames)
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

  private func animateAndShowCategoris(_ displayNames: [String]) {
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
    let selectedIndex: Int = sortedStatuses.index(of: categoryButton.title(for: .normal)!.capitalized)!
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
    label.textColor = .gray
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    picker.label = label
    picker.pickerSelectRowsForComponents = [0: [selectedIndex: true]]

    return picker
  }
}

extension ProductsViewController: ProductsView {
}
