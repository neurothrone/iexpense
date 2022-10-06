//
//  NumberFormatter+Extensions.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

extension NumberFormatter {
  static var currency: NumberFormatter {
    let formatter = Self()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    return formatter
  }
}
