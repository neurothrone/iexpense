//
//  ExpenseItemRowView.swift
//  iExpense
//
//  Created by Zaid Neurothrone on 2022-10-06.
//

import SwiftUI

struct ExpenseItemRowView: View {
  let item: ExpenseItem
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(item.name)
          .font(.headline)
        Text(item.type.rawValue.capitalized)
          .font(.footnote)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      Text(item.amount.toLocalCurrency)
        .foregroundColor(amountColorStyle)
    }
  }
  
  var amountColorStyle: Color {
    let amount = item.amount
    switch amount {
    case ...0:
      return .secondary
    case ...10:
      return .green
    case 10...100:
      return .orange
    default:
      return .red
    }
  }
}

struct ExpenseItemRowView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ExpenseItemRowView(item: ExpenseItem.Preview.sample)
    }
  }
}
