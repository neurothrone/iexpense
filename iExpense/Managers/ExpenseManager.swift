//
//  ExpenseManager.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

final class ExpenseManager: ObservableObject {
  @Published var items: [ExpenseItem] = [] {
    didSet {
      if let encodedItems = try? JSONEncoder().encode(items) {
        UserDefaults.standard.set(encodedItems, forKey: "items")
      }
    }
  }
  
  init() {
    guard let savedItems = UserDefaults.standard.data(forKey: "items"),
          let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems)
    else {
      items = []
      return
    }
    
    items = decodedItems
  }
}
