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
        .style(for: item)
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
