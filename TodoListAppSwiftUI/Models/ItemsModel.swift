//
//  ItemsModel.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import Foundation
struct ItemsModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplete: Bool
}
