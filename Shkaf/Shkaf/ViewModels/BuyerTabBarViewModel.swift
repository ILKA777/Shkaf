//
//  TabBarView.swift
//  Shkaf
//
//  Created by Илья on 02.03.2024.
//

import SwiftUI

struct BuyerTabBarViewModel: View {
    @StateObject var cartManager = CartManager()
    @StateObject var orderManager = OrderManager()
    @StateObject var favoritesManager = FavoritesManager()
    @State private var showMenu = false
    

    @State var currentTab = "Home"
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        NavigationView {
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showMenu)
                    .environmentObject(favoritesManager)
                    .environmentObject(orderManager)
                VStack(spacing: 0) {
                    TabView {
                        ProductsCatalogView(showMenu: $showMenu)
                            .environmentObject(cartManager)
                            .environmentObject(favoritesManager)
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Главная")
                                    
                            }
                            .tag("Home")
                        
                        // Tab 2
                        
                        FavoritesView()
                            .environmentObject(favoritesManager)
                            .tabItem {
                                Image(systemName: "heart")
                                Text("Избранное")
                            }
                        
                        CartViewForTabBar()
                            .environmentObject(cartManager)
                            .environmentObject(orderManager)
                            .environmentObject(OrderViewModel(cartManager: cartManager, orderManager: orderManager))
                            .tabItem {
                                CartButton(numberOfProducts: cartManager.totalCount)
                                //Image(systemName: "cart")
                                Text("Корзина")
                                
                                
                            }
                            .navigationBarTitle("Tab 2")
                        
                        UserProfileView()
                            .environmentObject(favoritesManager)
                            .environmentObject(orderManager)
                            .tabItem {
                                Image(systemName: "person.crop.circle")
                                Text("Профиль")
                            }
                    }
                }
                .frame(width: getRect().width)
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            
            .gesture(
            
                DragGesture()
                    .updating($gestureOffset, body: {value, out, _ in out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of:showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
        
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            if translation > 0 {
                
                if translation > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    offset = 0
                    showMenu = false
                }
                
            } else {
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        
        lastStoredOffset = offset
    }
        
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerTabBarViewModel()
    }
}
 
