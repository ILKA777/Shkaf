//
//  LoginView.swift
//  Shkaf
//
//  Created by Илья on 17.02.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isTabBarViewActive = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Войти")
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
                .ignoresSafeArea(.keyboard, edges: .all)
            
            SecureField("Введите пароль", text: $password)
                .padding()
                .frame(width: 350, height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
                .offset(y: -200)
                .ignoresSafeArea(.keyboard, edges: .all)
            
            NavigationLink(destination: TabBarView().navigationBarHidden(true), isActive: $isTabBarViewActive) {
                EmptyView()
            }
            
            Button(action: {
                // Set the state to activate the TabBarView navigation
                isTabBarViewActive = true
            }) {
                Text("Войти")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 15)
                    .padding()
                    .background(Color(uiColor: .CustomGreen()))
                    .cornerRadius(10)
                    
            }
            .offset(y: -170)
        }
        .padding()
        
        .ignoresSafeArea(.keyboard, edges: .all)
        
    }
   
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


#Preview {
    LoginView()
}
