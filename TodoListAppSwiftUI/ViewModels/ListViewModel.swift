//
//  ListViewModel.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemsModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemsModel(title: "This is first title", isComplete: false),
            ItemsModel(title: "This is the second", isComplete: true),
            ItemsModel(title: "Thrid", isComplete: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem( indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemsModel(title: title, isComplete: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemsModel) {
       if  let index = items.firstIndex { (existingItem) -> Bool in
            return existingItem.id == item.id
       } {
           items[index] = item.updateCompletion()
       }
        
    }
}
