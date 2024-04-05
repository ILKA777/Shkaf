//
//  UserProfileView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var orderManager: OrderManager
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Верхняя часть с кружочком и фото
                
                HStack {
                    Image("cat-face")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(UserManager.shared.currentUser.username ?? "Имя Фамилия")
                            .font(.headline)
//                        Text("Фамилия")
//                            .font(.subheadline)
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                            .foregroundColor(.primary)
                            .padding()
                    }
                    .offset(x: 170)
                    
                    Spacer()
                }
                .padding()
                .offset(x: 10)
                
                // Label и кнопки
                VStack(alignment: .leading, spacing: 20) {
                    Text("мой кабинет")
                        .font(.system(size: 32))
                        .bold()
                        .padding()
                    
                    NavigationLink(destination: MyPurchasesView().environmentObject(orderManager)) {
                        HStack {
                            Text("мои покупки")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -10)
                    
                    NavigationLink(destination: FavoritesView().environmentObject(favoritesManager)) {
                        
                        HStack {
                            Text("избранное")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -30)
                    
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Text("уведомления")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -50)
                    
                    NavigationLink(destination: DeliveryPaymentView()) {
                        HStack {
                            Text("доставка и оплата")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -70)
                    
                    Button(action: {
                        UserManager.shared.logout()
                    }) {
                        HStack {
                            Text("Выйти из профиля")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                                .bold()
                            Image(systemName: "door.left.hand.open")
                                .foregroundColor(.red)
                        }
                        .padding()
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
