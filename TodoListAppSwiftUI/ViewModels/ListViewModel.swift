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
    @Published var items: [ItemsModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "items_list"
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemsModel(title: "This is first title", isComplete: false),
//            ItemsModel(title: "This is the second", isComplete: true),
//            ItemsModel(title: "Thrid", isComplete: false)
//        ]
//        items.append(contentsOf: newItems)
        guard let data = UserDefaults.standard.data(forKey: itemKey) ,
        let saveItems = try? JSONDecoder().decode([ItemsModel].self, from: data)
        else  {return}
      
        items = saveItems
        
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
    
    func saveItems() {
        if let encodeaData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeaData, forKey: itemKey)
        }
    }
    
}
