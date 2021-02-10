//
//  ContentView.swift
//  TestNavigation WatchKit Extension
//
//  Created by admin on 10.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State
    var isActiv: Bool = false
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                TextField("", text: .constant("Test"))
                SecureField("", text: .constant("Pass"))
                
                //MARK: Для того чтобы менять дизайн кнопки свободно нудно указать buttonStyle(PlaintButtonStyle())
                
                //Это иконка.
                //Если убрать style то позади будет прозрачный овал
                NavigationLink(destination: Text("Hello")) {
                    Image(systemName: "person")
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
                
                
                //Это кнопка с переходом по условию например:
                //когда нужно провести авторизацию,
                //проверить поля на пустоту и тд
                VStack {
                    //Такой вариант хорошо работает кнопка полностью исчезает
                    // и не занимает место
                    NavigationLink(
                        destination: Text("Destination"),
                        isActive: self.$isActiv
                    ){
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // Такой вариант не очень удобен так как его нужно использовать
                    // всместе с zstack
                    // Такую кнопку хоть и не видно но она занимает место
                    NavigationLink(
                        destination: Text("Destination"),
                        isActive: self.$isActiv
                    ){
                        EmptyView()
                    }.opacity(0)
                    
                    Button(action: {
                        self.isActiv = true
                    }) {
                        HStack{
                            Spacer()
                            Text("Go")
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 12)
                    .background(Color.black)
                    .cornerRadius(5)
                }
            }
        }
    }
}
