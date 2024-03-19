//
//  SellerRegistrationView.swift
//  Shkaf
//
//  Created by Илья on 17.02.2024.
//

import SwiftUI

struct SellerRegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Регистрация продавца")
                .font(.largeTitle)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            
            TextField("Введите почту", text: $email)
                .padding()
                .frame(width: 350, height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            SecureField("Введите пароль", text: $password)
                .padding()
                .frame(width: 350, height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            
            // Spacer()
            
            Button(action: {
                // Действие при нажатии кнопки "Войти"
                print("Войти")
            }) {
                Text("Войти")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .CustomGreen()))
                    .cornerRadius(10)
                    .frame(height: 50)
                    .offset(y: 30)
            }
        }
        .padding()
    }
}

struct SellerRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        SellerRegistrationView()
    }
}


#Preview {
    SellerRegistrationView()
}
