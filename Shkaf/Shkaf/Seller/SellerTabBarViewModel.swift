//
//  SellerTabBarViewModel.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerTabBarViewModel: View {
    @StateObject var cartManager = CartManager()
    @StateObject var orderManager = OrderManager()
    @StateObject var favoritesManager = FavoritesManager()
    
    @State var currentTab = "Home"
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    TabView {
                        SellerActiveOrdersView()
                            .environmentObject(orderManager)
                            .tabItem {
                                Image(systemName: "shippingbox")
                                Text("Заказы")
                            }
                            .tag("Home")
                        
                        SellerProductsCatalogView()
                            .environmentObject(favoritesManager)
                            .tabItem {
                                Image(systemName: "tshirt")
                                Text("Мои товары")
                            }
                        
                        CreateProductView()
                            .environmentObject(cartManager)
                            .environmentObject(orderManager)
                            .tabItem {
                                Image(systemName: "plus")
                                Text("Создать карточку")
                            }
                        
                        SellerProfileView()
                            .environmentObject(orderManager)
                            .tabItem {
                                Image(systemName: "person.crop.circle")
                                Text("Профиль")
                            }
                    }
                }
                .frame(width: getRect().width)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct SellerTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        SellerTabBarViewModel()
    }
}
