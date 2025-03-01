//
//  ListView.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemsModel] = [
        ItemsModel(title: "This is first title", isComplete: false),
        ItemsModel(title: "This is the second", isComplete: true),
        ItemsModel(title: "Thrid", isComplete: false)
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            AddView()
        }))
        
    }
}

#Preview {
    NavigationView {
        ListView()
    }
   
}
