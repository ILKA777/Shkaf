//
//  AuthViewModel.swift
//  Shkaf
//
//  Created by Илья on 29.03.2024.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthSuccessful = false
    
    func authUser() {
        guard let url = URL(string: "http://localhost:8090/login") else {
            print("Invalid URL")
            return
        }
        
        let parameters = [
            "username": userName,
            "password": password,
            "email": email,
            "role": "CLIENT"
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            print("Failed to serialize parameters")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let token = String(data: data, encoding: .utf8) {
                            // Сохраняем токен в UserDefaults
//                            UserManager.init()
//                            UserDefaults.standard.set(token, forKey: "userToken")
//                            UserDefaults.standard.set(self.userName, forKey: "userName")
//                            UserDefaults.standard.set(self.email, forKey: "email")
                            UserManager.shared.createUser(username: self.userName, email: self.email, userToken: token)
                            print(token)
                            print(self.userName)
                            // Устанавливаем isRegistrationSuccessful на главном потоке
                            self.isAuthSuccessful = true
                        }
                    } else {
                        print("HTTP Response Error: \(httpResponse.statusCode)")
                    }
                }
            }
        }.resume()
    }
}

