//
//  AuthViewModel.swift
//  Shkaf
//
//  Created by Илья on 29.03.2024.
//

import SwiftUI

class BuyerAuthViewModel: ObservableObject {
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
                            UserManager.shared.createUser(username: self.userName, email: self.email, userToken: token)
                            print(token)
                            print(self.userName)
                            // Устанавливаем isRegistrationSuccessful на главном потоке
                            self.isAuthSuccessful = true
                            SessionManager.shared.login()
                            
                        }
                        
                    } else if httpResponse.statusCode == 403 {
                        // Показываем алерт с сообщением о неверных данных
                        let alert = UIAlertController(title: "Ошибка", message: "Проверьте корректность введенных данных.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                    } else {
                        print("HTTP Response Error: \(httpResponse.statusCode)")
                    }
                }
            }
        }.resume()
    }
}

