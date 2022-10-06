//
//  Double+Extensions.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

extension Double {
  var toLocalCurrency: String {
    NumberFormatter.currency.string(from: self as NSNumber) ?? Self.zero.description
  }
}
