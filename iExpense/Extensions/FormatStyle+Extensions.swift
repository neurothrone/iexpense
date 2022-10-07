//
//  FormatStyle+Extensions.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
  static var localCurrency: Self {
    .currency(code: Locale.current.identifier)
  }
}
