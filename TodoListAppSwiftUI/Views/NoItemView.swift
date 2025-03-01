//
//  NoItemView.swift
//  TodoListAppSwiftUI
//
//  Created by van xuat Tran on 1/3/25.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secandaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add bunch of items to your todo list!")
                    .padding(.bottom,20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🦀")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secandaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal,animate ? 30 : 50)
                .shadow(color:animate ? secandaryAccentColor.opacity(0.7) : .accentColor.opacity(0.7),
                        radius:animate ?  30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("Title")
    }
   
}
