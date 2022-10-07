//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

struct ExpenseItem: Identifiable {
  var id: UUID = .init()
  let name: String
  let amount: Double
  let type: ExpenseType
}

extension ExpenseItem: Codable {}

extension ExpenseItem: Equatable {
  static func ==(lhs: ExpenseItem, rhs: ExpenseItem) -> Bool {
    lhs.id == rhs.id
  }
}
