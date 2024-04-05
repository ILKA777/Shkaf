//
//  UserManager.swift
//  Shkaf
//
//  Created by Илья on 05.04.2024.
//

import SwiftUI

class UserManager: ObservableObject {
    static let shared = UserManager()
    
    private let userDefaults = UserDefaults.standard
    private enum UserDefaultsKeys {
        static let userToken = "userToken"
        static let username = "userName"
        static let email = "email"
    }
    
    @Published var currentUser: User
    
    private init() {
        let storedToken = userDefaults.string(forKey: UserDefaultsKeys.userToken)
        let userName = userDefaults.string(forKey: UserDefaultsKeys.username)
        let email = userDefaults.string(forKey: UserDefaultsKeys.email)
        
        self.currentUser = User(username: userName, email: email, userToken: storedToken)
    }
    
    func createUser(username: String, email: String, userToken: String) {
        userDefaults.set(userToken, forKey: UserDefaultsKeys.userToken)
        userDefaults.set(username, forKey: UserDefaultsKeys.username)
        userDefaults.set(email, forKey: UserDefaultsKeys.email)
        
        self.currentUser = User(username: username, email: email, userToken: userToken)
    }
    
    func logout() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.userToken)
        userDefaults.removeObject(forKey: UserDefaultsKeys.username)
        userDefaults.removeObject(forKey: UserDefaultsKeys.email)
        
        self.currentUser = User(username: nil, email: nil, userToken: nil)
    }
    
    func isLoggedIn() -> Bool {
        return currentUser.userToken != nil
    }
}
