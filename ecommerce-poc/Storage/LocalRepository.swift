//
//  LocalRepository.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

protocol LocalRepository {
  func getCategories() -> Observable<[LocalCategory]>
  func getProduts(_ categoryId: Int, orderBy: String)-> Observable<[Product]>
  func getSubCategories(for categoryId: Int) -> Observable<[LocalCategory]>
  func getChildCategories(for categories: Int) -> Observable<[LocalCategory]>
  func getChildCategories(with subCategoryId: Int) -> Observable<[LocalCategory]>
  func filterProductsBy(_ category: Int, _ subCategory: Int, _ childCategory: Int, _ orderBy: String) -> Observable<FetchEvent<[Product]>>
  func getVariants(for productId: Int) -> Observable<[Variant]>
}
