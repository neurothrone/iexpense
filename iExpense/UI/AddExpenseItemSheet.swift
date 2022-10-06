//
//  AddExpenseItemSheet.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct AddExpenseItemSheet: View {
  @Environment(\.dismiss) private var dismiss
  
  @ObservedObject var manager: ExpenseManager
  
  @State private var name = ""
  @State private var amount: Double = .zero
  
  @AppStorage("selectedType")
  private var selectedType: ExpenseType = .personal
  
  var localCurrency: FloatingPointFormatStyle<Double>.Currency {
    .currency(code: Locale.current.identifier)
  }
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $name)
          .autocorrectionDisabled(true)
        
        TextField("Amount", value: $amount, format: .localCurrency)
          .keyboardType(.decimalPad)
        
        Section {
          Picker("Expense Type", selection: $selectedType) {
            ForEach(ExpenseType.allCases) {
              Text($0.rawValue.capitalized)
            }
          }
          .pickerStyle(.segmented)
        } header: {
          Text("Expense Type")
            .textCase(.none)
        }
        
        Button {
          addItem()
        } label: {
          Text("Add")
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .disabled(name.isEmpty || amount == .zero)
      }
      .navigationTitle("Add New Expense")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

extension AddExpenseItemSheet {
  private func addItem() {
    let newItem = ExpenseItem(
      name: name,
      amount: amount,
      type: selectedType
    )
    
    manager.items.append(newItem)
    dismiss()
  }
}

struct AddExpenseItemSheet_Previews: PreviewProvider {
  static var previews: some View {
    AddExpenseItemSheet(manager: .init())
  }
}
