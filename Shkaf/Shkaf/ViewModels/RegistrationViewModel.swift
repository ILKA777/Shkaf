//
//  RegistrationViewModel.swift
//  Shkaf
//
//  Created by Илья on 27.03.2024.
//

import Foundation
import Alamofire

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var matchingPassword: String = ""
    @Published var isRegistrationSuccessful = false
    
    func registerUser() {
        // Проверяем, совпадают ли пароли
        guard password == matchingPassword else {
            // Если пароли не совпадают, показываем Alert
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Ошибка", message: "Вы ввели два разных пароля", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                // Получаем текущий ключ окна
                if let window = UIApplication.shared.windows.first {
                    window.rootViewController?.present(alert, animated: true, completion: nil)
                }
            }
            return
        }
        
        // Если пароли совпадают, выполняем регистрацию пользователя
        guard let url = URL(string: "http://localhost:8090/register") else {
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
        
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let token = String(data: data, encoding: .utf8) {
                            // Сохраняем токен в UserDefaults
//                            UserDefaults.standard.set(token, forKey: "userToken")
//                            UserDefaults.standard.set(self.userName, forKey: "userName")
//                            UserDefaults.standard.set(self.email, forKey: "email")
                            UserManager.shared.createUser(username: self.userName, userToken: token)
                            print(token)
                            // Устанавливаем isRegistrationSuccessful на главном потоке
                            self.isRegistrationSuccessful = true
                        }
                    } else if httpResponse.statusCode == 400 {
                        // Пользователь с таким именем уже существует
                        if let message = String(data: data, encoding: .utf8), message.contains("Username already exists") {
                            DispatchQueue.main.async {
                                let alert = UIAlertController(title: "Ошибка", message: "Пользователь с таким именем уже существует", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                
                                // Получаем текущий ключ окна
                                if let window = UIApplication.shared.windows.first {
                                    window.rootViewController?.present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                    } else {
                        print("HTTP Response Error: \(httpResponse.statusCode)")
                    }
                }
            }
        }.resume()
    }
}
