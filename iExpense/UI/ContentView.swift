//
//  ContentView.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-05.
//

import SwiftUI

struct ContentView: View {
  @State private var isAddExpenseViewPresented = false
  
  @StateObject private var manager: ExpenseManager
  
  init(manager: ExpenseManager = .init()) {
    _manager = StateObject(wrappedValue: manager)
  }
  
  var body: some View {
    NavigationStack {
      ExpenseItemListView(
        items: manager.items,
        onDeleteItem: { item in
          delete(item: item)
        }
      )
      .navigationTitle("iExpense")
      .sheet(isPresented: $isAddExpenseViewPresented) {
        AddExpenseItemSheet(manager: manager)
      }
      .toolbar {
        Button {
          isAddExpenseViewPresented.toggle()
        } label: {
          Image(systemName: "plus")
        }
      }
    }
  }
}

extension ContentView {
  private func delete(item: ExpenseItem) {
    guard let index = manager.items.firstIndex(where: { $0.id == item.id }) else { return }
    
    manager.items.remove(at: index)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let manager: ExpenseManager = .init()
    manager.items = ExpenseItem.Preview.samples
    
    return ContentView(manager: manager)
  }
}
