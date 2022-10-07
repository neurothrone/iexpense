//
//  ExpenseItem+Preview.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import Foundation

extension ExpenseItem {
  enum Preview {
    static var sample: ExpenseItem {
      .init(name: "Groceries", amount: 250, type: .personal)
    }
    
    static var personalExpenses: [ExpenseItem] {
      samples.filter { $0.type == .personal }
    }
    
    static var businessExpenses: [ExpenseItem] {
      samples.filter { $0.type == .business }
    }
    
    static var samples: [ExpenseItem] {
      [
        .init(name: "Test", amount: 0, type: .personal),
        .init(name: "Apple", amount: 1, type: .personal),
        .init(name: "Mobile services", amount: 99.9, type: .personal),
        .init(name: "Groceries", amount: 250, type: .personal),
        .init(name: "Travel costs", amount: 200, type: .business),
        .init(name: "Client costs", amount: 350, type: .business),
        .init(name: "Rent", amount: 300, type: .personal),
        .init(name: "Groceries", amount: 150, type: .personal)
      ]
    }
  }
}
