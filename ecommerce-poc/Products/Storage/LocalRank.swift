//
//  LocalRank.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 08/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import GRDB

class LocalRank: Record, Decodable {
  struct Column {
    static let id = "id"
    static let viewCount = "view_count"
    static let orderCount = "order_count"
    static let shares = "shares"
  }

  let id: Int
  var viewCount, orderCount, shares: Int?

  init(id: Int, viewCount: Int?, orderCount: Int?, shares: Int?) {
    self.id = id
    self.viewCount = viewCount
    self.orderCount = orderCount
    self.shares = shares
    super.init()
  }

  override public class var databaseTableName: String {
    return "rank"
  }

  enum CodingKeys: String, CodingKey {
    case id
    case viewCount = "view_count"
    case orderCount = "order_count"
    case shares
  }

  required init(row: Row) {
    id = row[Column.id]
    viewCount = row[Column.viewCount]
    orderCount = row[Column.orderCount]
    shares = row[Column.shares]
    super.init(row: row)
  }

  public override func encode(to container: inout PersistenceContainer) {
    container[Column.id] = id
    container[Column.viewCount] = viewCount
    container[Column.orderCount] = orderCount
    container[Column.shares] = shares
  }
}

extension LocalRank: Equatable {
  static func == (lhs: LocalRank, rhs: LocalRank) -> Bool {
    return lhs.id == rhs.id
  }
}

extension LocalRank: Hashable {
  public var hashValue: Int {
    return id.hashValue
  }
}
