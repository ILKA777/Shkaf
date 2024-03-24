//
//  SellerLoginView.swift
//  Shkaf
//
//  Created by Илья on 17.02.2024.
//

import SwiftUI

struct SellerLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isTabBarViewActive = false
    
    var body: some View {
        //NavigationView {
            VStack(alignment: .center) {
                Text("Войти как продавец")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .offset(y: -200)
                
                TextField("Введите почту", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 24)
                    .offset(y: -200)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .frame(width: 350, height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 24)
                    .offset(y: -200)
                
                
                // Spacer()
                
                NavigationLink(destination: SellerTabBarViewModel().navigationBarHidden(true), isActive: $isTabBarViewActive) {
                    EmptyView()
                }
                Button(action: {
                    // Действие при нажатии кнопки "Войти"
                    print("вошел")
                   isTabBarViewActive = true
                }) {
                    Text("Войти")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: .CustomGreen()))
                        .cornerRadius(10)
                        .frame(height: 50)
                        
                }
                .offset(y: 30)
                .offset(y: -200)
            }
            .padding()
        }
    //}
}

#Preview {
    SellerLoginView()
}
