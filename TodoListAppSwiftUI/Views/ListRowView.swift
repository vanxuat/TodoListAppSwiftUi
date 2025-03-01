//
//  ListRowView.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemsModel
    
    
    var body: some View {
        HStack{
            Image(systemName: item.isComplete ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        ListRowView(item: ItemsModel(title: "Test", isComplete: false))
        ListRowView(item: ItemsModel(title: "Test", isComplete: true))
    }
}


