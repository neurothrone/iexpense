//
//  FormatStyle+Extensions.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double> {
  static var localCurrency: FloatingPointFormatStyle<Double>.Currency {
    .init(code: Locale.current.identifier)
  }
}
