//
//  PaymentButton.swift
//  Shkaf
//
//  Created by Илья on 07.02.2024.
//

import SwiftUI
import PassKit

struct PaymentButton: View {
    var action: () -> Void
    
    
    
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    PaymentButton(action: {})
}
extension PaymentButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
        
        class Coordinator: NSObject {
            var action: () -> Void
            var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
            
            init(action: @escaping () -> Void) {
                self.action = action
                super.init()
                
                button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
            }
            
            @objc
            func callback(_ sender: Any) {
                action()
            }
            
            @objc
            func showAlert(_ sender: UIButton) {
                let alert = UIAlertController(title: "Внимание!", message: "Функция оплаты через ApplePay будет доступна позже", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    // Handle OK button action if needed
                }))
                
                // Find the topmost view controller to present the alert
                if let topViewController = UIApplication.shared.windows.first?.rootViewController {
                    topViewController.present(alert, animated: true, completion: nil)
                }
                
                action() // Perform the action associated with the PaymentButton
            }
        }
    }
}
