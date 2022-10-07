//
//  AddExpenseItemSheet.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct AddExpenseItemSheet: View {
  private enum Field {
    case name, amount
  }
  
  @Environment(\.dismiss) private var dismiss
  @FocusState private var focusedField: Field?
  
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
          .focused($focusedField, equals: .name)
          .submitLabel(.next)
        
        TextField("Amount", value: $amount, format: .localCurrency)
          .keyboardType(.decimalPad)
          .focused($focusedField, equals: .amount)
          .submitLabel(.done)
        
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
      .onSubmit {
        switch focusedField {
        case .name:
          focusedField = .amount
        default:
          focusedField = nil
        }
      }
      .navigationTitle("Add New Expense")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          Button("Dismiss") {
            focusedField = nil
          }
        }
      }
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
