//
//  ProductsModel.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift

class ProductsModel {
  class func bind(_ intentions: ProductsIntentions,
                  _ lifecycle: Observable<MviLifecycle>,
                  _ categoryId: Int,
                  _ states: Observable<ProductsState>,
                  _ localRepository: LocalRepository) -> Observable<ProductsState> {
    let initialState = getInitialState(categoryId, localRepository)
    let lifecycleStates = lifecycle
      .filter { $0 == .created }
      .flatMapLatest { _ in
        initialState.flatMap { initialState -> Observable<ProductsState> in
          return localRepository
            .getProduts(categoryId, orderBy: initialState.orderBy)
            .map { products -> ProductsState in
              let copiedState = ProductsState(initialState)
              copiedState.fetchAction = .fetchSuccessful
              copiedState.products = products
              return copiedState
          }
        }
    }

    let restoredStates = lifecycle
      .filter { $0 == .restored }
      .flatMapLatest { _ in
        initialState.flatMap { initialState in
          return localRepository
            .getProduts(categoryId, orderBy: initialState.orderBy)
            .flatMapLatest { products  -> Observable<ProductsState> in
              let copiedState = ProductsState(initialState)
              copiedState.fetchAction = .fetchSuccessful
              copiedState.products = products
              return Observable.just(copiedState)
          }
        }
    }

    let categoryFilterStates = states
      .flatMapLatest { state in
        intentions.filterByCategory()
          .flatMapLatest { categoryKey in
            localRepository
              .getChildCategories(with: categoryKey)
              .flatMapLatest { childCategories in
                self.fetchProducts(categoryId,
                                   subCategoryKey: categoryKey,
                                   categories: childCategories,
                                   state: state,
                                   repository: localRepository)
            }

        }
    }

    let subCategoryFilterStates = states
      .flatMapLatest { state in
        intentions.filterBySubCategory()
          .flatMapLatest { subCategoryKey in
            localRepository
              .filterProductsBy(categoryId,
                                state.subCategoryId,
                                subCategoryKey,
                                state.orderBy)
              .flatMapLatest { fetchEvent -> Observable<ProductsState> in
                let copiedState = ProductsState(state)
                copiedState.fetchAction = .fetchSuccessful
                copiedState.childCategoryId = subCategoryKey
                copiedState.products = fetchEvent.result ?? []
                return Observable.just(copiedState)
            }

        }
    }

    let rankFilterStates = states
      .flatMapLatest { state in
        intentions.orderByRank()
          .flatMapLatest { rank in
            localRepository
              .filterProductsBy(categoryId,
                                state.subCategoryId,
                                state.childCategoryId,
                                rank)
              .flatMapLatest { fetchEvent -> Observable<ProductsState> in
                let copiedState = ProductsState(state)
                copiedState.fetchAction = .fetchSuccessful
                copiedState.orderBy = rank
                copiedState.products = fetchEvent.result ?? []
                return Observable.just(copiedState)
            }
        }
    }

    return Observable
      .merge(lifecycleStates,
             restoredStates,
             categoryFilterStates,
             subCategoryFilterStates,
             rankFilterStates)
  }

  private static func getInitialState(_ categoryId: Int, _ repository: LocalRepository) -> Observable<ProductsState> {
    return repository
      .getChildCategories(for: categoryId)
      .map { childCategories -> ProductsState in
        return ProductsState.init(childCategories: childCategories)
    }
  }

  private static func fetchProducts(_ categoryId: Int,
                                    subCategoryKey: Int,
                                    categories: [LocalCategory],
                                    state: ProductsState,
                                    repository: LocalRepository) -> Observable<ProductsState> {
    return repository
      .filterProductsBy(categoryId,
                        subCategoryKey,
                        state.childCategoryId,
                        state.orderBy)
      .flatMapLatest { fetchEvent -> Observable<ProductsState> in
        let copiedState = ProductsState(state)
        copiedState.fetchAction = .fetchSuccessful
        copiedState.subCategoryId = subCategoryKey
        copiedState.products = fetchEvent.result ?? []
        copiedState.childCategories = categories
        return Observable.just(copiedState)
    }
  }
}
