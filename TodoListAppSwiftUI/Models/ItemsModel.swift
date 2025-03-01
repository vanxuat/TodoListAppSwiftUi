//
//  ItemsModel.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import Foundation
struct ItemsModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString,title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    
    func updateCompletion() -> ItemsModel {
        return ItemsModel(id: self.id, title: title, isComplete: !isComplete)
    }
}
