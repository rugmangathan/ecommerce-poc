//
//  ProductDetailViewController.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 09/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProductDetailCell: UITableViewCell {
  @IBOutlet weak var colorLabel: UILabel!
  @IBOutlet weak var sizeLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var taxValueLabel: UILabel!
  @IBOutlet weak var taxNameLabel: UILabel!
  @IBOutlet weak var totalCostLabel: UILabel!
  @IBOutlet weak var sizeStackView: UIStackView!
  
}

class ProductDetailViewController: MviController<ProductDetailState>, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var variantsTableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  private let colorRelay = PublishRelay<String>()
  private let sizeRelay = PublishRelay<Int>()

  var product: Product!
  var variants = [Variant]() {
    didSet {
      variantsTableView.reloadData()
    }
  }

  private lazy var repository: LocalRepository = {
    return GrdbRepository(CategoryDao(dbQueue))
  }()

  private lazy var renderer: ProductDetailViewRenderer = {
    return ProductDetailViewRenderer(self)
  }()

  private lazy var intentions: ProductDetailIntentions = {
    return ProductDetailIntentions(colorRelay.asObservable(), sizeRelay.asObservable())
  }()

  private lazy var formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    formatter.currencyCode = "INR"
    return formatter
  }()

  override func bind(states: Observable<ProductDetailState>) -> Observable<ProductDetailState> {
    return ProductDetailModel
      .bind(intentions, lifecycle.asObservable(), product.id, repository)
  }

  override func preBind() {
    title = product.name
    variantsTableView.tableFooterView = UIView()
  }

  override func effects(state: ProductDetailState) {
    renderer.render(state: state)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return variants.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView
      .dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath)
      as! ProductDetailCell

    let variant = variants[indexPath.row]
    cell.colorLabel.text = variant.color
    if let validSize = variant.size {
      cell.sizeLabel.text = "\(validSize)"
      cell.sizeStackView.isHidden = false
    } else {
      cell.sizeStackView.isHidden = true
    }
    cell.priceLabel.text = formatter.string(from: variants[indexPath.row].price)
    cell.taxNameLabel.text = product.taxName
    cell.taxValueLabel.text = "\(product.taxValue.stringValue)%"
    cell.totalCostLabel.text = formatter.string(from: getTotalPrice(for: variant))

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 84.0
  }

  private func getTotalPrice(for variant: Variant) -> NSDecimalNumber {
    let vatAmount = variant.price
      .multiplying(by: product.taxValue)
      .dividing(by: NSDecimalNumber(value: 100))
    return variant.price.adding(vatAmount)
  }
}

extension ProductDetailViewController: ProductDetailView {
  func showVariants(_ variants: [Variant]) {
    self.variants = variants
  }

  func showProgress(_ show: Bool) {
    show
      ? activityIndicator.startAnimating()
      : activityIndicator.stopAnimating()
    activityIndicator.isHidden = !show
  }

  func showFetchFailedMesssage() {
    let alertView = UIAlertController(title: "Error",
                                      message: "No variants found",
                                      preferredStyle: .alert)
    alertView.addAction(UIAlertAction(title: "Ok", style: .default))
    present(alertView, animated: true)
  }
}
