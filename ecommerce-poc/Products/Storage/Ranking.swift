//
//  Ranking.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation

enum Rank: String, Decodable {
  case view =  "Most Viewed Products"
  case order = "Most OrdeRed Products"
  case share = "Most ShaRed Products"
}

class Ranking: Decodable {
  let ranking: Rank
  let products: [LocalRank]

  init(ranking: Rank, products: [LocalRank]) {
    self.ranking = ranking
    self.products = products
  }

  enum CodingKeys: String, CodingKey {
    case ranking
    case products
  }

  convenience required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let rankingString = try values.decode(String.self, forKey: .ranking)
    guard let ranking = Rank(rawValue: rankingString) else {
      fatalError("Found invalid value for ranking: \(rankingString)")
    }
    let products = try values.decode([LocalRank].self, forKey: .products)

    self.init(ranking: ranking, products: products)
  }
}
