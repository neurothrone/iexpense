//
//  View+Extensions.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-07.
//

import SwiftUI

extension View {
  func style(for item: ExpenseItem) -> some View {
    switch item.amount {
    case ...0:
      return self
        .font(.body)
        .foregroundColor(.secondary)
    case ...10:
      return self
        .font(.body)
        .foregroundColor(.green)
    case 10...100:
      return self
        .font(.headline)
        .foregroundColor(.orange)
    default:
      return self
        .font(.title3)
        .foregroundColor(.red)
    }
  }
}
