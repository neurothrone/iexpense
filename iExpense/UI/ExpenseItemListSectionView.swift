//
//  ExpenseItemListSectionView.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct ExpenseItemListSectionView: View {
  let items: [ExpenseItem]
  let expenseType: ExpenseType
  let onDeleteItem: (_ item: ExpenseItem) -> Void
  
  var body: some View {
    Section {
      ForEach(items) { item in
        ExpenseItemRowView(item: item)
      }
      .onDelete { indexSet in
        if let index = indexSet.first {
          onDeleteItem(items[index])
        }
      }
    } header: {
      Text("\(expenseType.rawValue.capitalized) Expenses")
    }
  }
}

struct ExpenseItemListSectionView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ExpenseItemListSectionView(
        items: ExpenseItem.Preview.personalExpenses,
        expenseType: .personal,
        onDeleteItem: { _ in }
      )
    }
  }
}
