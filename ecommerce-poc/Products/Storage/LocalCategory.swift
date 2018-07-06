//
//  LocalCategory.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import GRDB

public class LocalCategory: Record, Equatable {

  struct Column {
    static let id = "id"
    static let name = "name"
    static let parent = "parent"
  }

  let id: Int
  let name: String
  var parent: Int?

  public init(_ id: Int,
       _ name: String,
       _ parent: Int?) {
    self.id = id
    self.name = name
    self.parent = parent
    super.init()
  }

  override public class var databaseTableName: String {
    return "category"
  }

  required public init(row: Row) {
    id = row[Column.id]
    name = row[Column.name]
    parent = row[Column.parent]
    super.init(row: row)
  }

  public override func encode(to container: inout PersistenceContainer) {
    container[Column.id] = id
    container[Column.name] = name
    container[Column.parent] = parent
  }

  public static func ==(lhs: LocalCategory, rhs: LocalCategory) -> Bool {
    return lhs.id == rhs.id
  }
}
