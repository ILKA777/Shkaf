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
    }
    
    @Published var currentUser: User
    
    private init() {
        let storedToken = userDefaults.string(forKey: UserDefaultsKeys.userToken)
        let userName = userDefaults.string(forKey: UserDefaultsKeys.username)
        
        self.currentUser = User(username: userName, userToken: storedToken)
    }
    
    func createUser(username: String, userToken: String) {
        userDefaults.set(userToken, forKey: UserDefaultsKeys.userToken)
        userDefaults.set(username, forKey: UserDefaultsKeys.username)
        
        self.currentUser = User(username: username, userToken: userToken)
    }
    
    func logout() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.userToken)
        userDefaults.removeObject(forKey: UserDefaultsKeys.username)
        
        self.currentUser = User(username: nil, userToken: nil)
    }
    
    func isLoggedIn() -> Bool {
        return currentUser.userToken != nil
    }
}
