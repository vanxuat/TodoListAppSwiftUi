//
//  ListView.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 🐟")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            AddView()
        }))
        
    }
    
   
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
   
}
