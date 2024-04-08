//
//  SessionManager.swift
//  Shkaf
//
//  Created by Илья on 06.04.2024.
//

import SwiftUI
class SessionManager: ObservableObject {
    @Published var isLoggedIn = UserManager.shared.isLoggedIn()
    static let shared = SessionManager()
    
    func login() {
        // Здесь происходит логин
        isLoggedIn = true
    }
    
    func logout() {
        // Очистка данных или любые другие операции при выходе
        // coreDataManager.clearCoreData() // Раскомментируйте, если нужно очистить Core Data
        isLoggedIn = false
        
        // Находим окно приложения
        if let window = UIApplication.shared.windows.first {
            // Создаем новый экземпляр представления для входа в систему (замените на ваш экран входа в систему)
            let rootView = ContentView()
                .environmentObject(SessionManager())
            
            // Обертываем rootView в UINavigationController
            let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: rootView))
            
            // Устанавливаем navigationController как корневой контроллер окна
            window.rootViewController = navigationController
            
            // Опционально: анимируем переход
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
