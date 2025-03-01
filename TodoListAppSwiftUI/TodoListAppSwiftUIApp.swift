//
//  TodoListAppSwiftUIApp.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

@main
struct TodoListAppSwiftUIApp: App {
    @StateObject  var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // điều chình navigation phù hợp với từng thiết bị
            .environmentObject(listViewModel)
        }
    }
}
