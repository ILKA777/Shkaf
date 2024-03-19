//
//  RegistrationView.swift
//  Shkaf
//
//  Created by Илья on 12.02.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isOrganizationInfoViewActive = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Регистрация")
                .font(.largeTitle)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .offset(x: 20)
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
            
            Button(action: {
                // Действие при нажатии кнопки "Войти"
                print("Войти")
            }) {
                Text("Войти")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 360)
                    .background(Color(uiColor: .CustomGreen()))
                    .cornerRadius(10)
                    .frame(height: 50)
                    .offset(y: 30)
                    
            }
            .offset(y: -200)
            
            NavigationLink(destination: OrganizationInfoView(), isActive: $isOrganizationInfoViewActive) {
                EmptyView()
            }
            
            Button(action: {
                isOrganizationInfoViewActive = true
            }) {
                Text("Регистрация продавца")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .frame(height: 50)
                    
            }
            .offset(y: -170)
            .padding()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


#Preview {
    RegistrationView()
}
