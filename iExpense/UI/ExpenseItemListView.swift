//
//  ExpenseItemListView.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct ExpenseItemListView: View {
  let items: [ExpenseItem]
  let onDeleteItem: (_ item: ExpenseItem) -> Void
  
  private var personalExpenses: [ExpenseItem] {
    items.filter { $0.type == .personal }
  }
  
  private var businessExpenses: [ExpenseItem] {
    items.filter { $0.type == .business }
  }
  
  var body: some View {
    List {
      ExpenseItemListSectionView(items: personalExpenses, expenseType: .personal) { item in
        onDeleteItem(item)
      }
      
      ExpenseItemListSectionView(items: businessExpenses, expenseType: .business) { item in
        onDeleteItem(item)
      }
    }
  }
}

struct ExpenseItemListView_Previews: PreviewProvider {
  static var previews: some View {
    ExpenseItemListView(
      items: ExpenseItem.Preview.samples,
      onDeleteItem: { _ in }
    )
  }
}
