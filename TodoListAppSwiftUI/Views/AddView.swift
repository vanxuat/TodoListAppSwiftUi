//
//  AddView.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🏉")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
   
}
