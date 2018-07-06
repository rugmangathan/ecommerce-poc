//
//  CommonApi.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

protocol CommonApiProtocol {
  func retrieveProducts() -> Observable<ProductsResponse>
}

class CommonApi: CommonApiProtocol {
  private lazy var sessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpCookieAcceptPolicy = .never
    configuration.httpShouldSetCookies = false

    return SessionManager(
      configuration: configuration,
      serverTrustPolicyManager: nil
    )
  }()

  func retrieveProducts() -> Observable<ProductsResponse> {
    let urlString = "https://stark-spire-93433.herokuapp.com/json"
    guard let url = URL(string: urlString) else {
      fatalError("'url'is not valid.")
    }

    return Observable<ProductsResponse>.create { observer in
      let request = self.sessionManager
        .request(url, method: .get)

      request
        .validate()
        .responseData { response in
          if let validResponse = response.response, let validData = response.data {
            if 200...299 ~= validResponse.statusCode {
              do {
                let responseObject = try JSONDecoder().decode(ProductsResponse.self, from: validData)
                observer.onNext(responseObject)
                observer.onCompleted()
              } catch let error {
                observer.onError(error)
              }
            }
          }
      }
      return Disposables.create {
        request.cancel()
      }
    }
  }
}
