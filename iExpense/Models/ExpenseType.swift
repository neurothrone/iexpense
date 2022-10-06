//
//  ExpenseType.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

enum ExpenseType: String {
  case personal, business
}

extension ExpenseType: Identifiable, CaseIterable {
  var id: Self { self }
}

extension ExpenseType: Codable {}
