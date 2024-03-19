//
//  SideMenu.swift
//  Shkaf
//
//  Created by Илья on 05.03.2024.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @State private var showFavorites = false
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Image("cat-face")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("имя фамилия")
                    .font(.title2.bold())
                Text("@ilka")
                    .font(.callout)
                
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 45) {
                    
                    NavigationLink(destination: UserProfileView().environmentObject(favoritesManager)) {
                        HStack(spacing: 14) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Профиль")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    NavigationLink(destination: BrandsCatalogView()) {
                        HStack(spacing: 14) {
                            Image(systemName: "b.circle")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Каталог брендов")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    NavigationLink(destination: MyPurchasesView()) {
                        HStack(spacing: 14) {
                            Image(systemName: "handbag")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Заказы")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    NavigationLink(destination: DeliveryPaymentView()) {
                        HStack(spacing: 14) {
                            Image(systemName: "shippingbox")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Доставка и оплата")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    NavigationLink(destination: FavoritesView().environmentObject(favoritesManager)) {
                        HStack(spacing: 14) {
                            Image(systemName: "heart")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Избранное")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        HStack(spacing: 14) {
                            Image(systemName: "gear")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Настройки")
                        }
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TabButton(title: "Выйти из аккаунта", image: "door.left.hand.open")
                    
                    
                }
                .padding()
                .padding(.leading)
                .padding(.top, 35)
            }
            
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
            
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 14) {
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
