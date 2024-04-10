//
//  ProfuctsCatalogView.swift
//  Shkaf
//
//  Created by Илья on 08.02.2024.
//

import SwiftUI

struct ProductsCatalogView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Binding var showMenu: Bool
    @State private var isLoading = false
    
    @State private var isShowingSearch = false // To toggle search bar visibility
    @State private var searchText = "" // To hold the search text
    @State private var selectedProduct: Product? // Track selected product for navigation
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                if isShowingSearch {
                    TextField("Поиск товаров...", text: $searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                BrandsCarouselView(brandList: brandList)
                    .padding(.bottom)
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(SellerProductsManager.shared.productList.filter {
                                searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                            }, id: \.id) { product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    ProductCard(product: product)
                                }
                                .environmentObject(cartManager)
                                .environmentObject(favoritesManager)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(Text("Shkaf"))
            .navigationBarItems(leading:
                                    Button(action: {
                withAnimation { showMenu.toggle() }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            }
            )
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation { isShowingSearch.toggle() }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                    }
                    
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                        .environmentObject(OrderViewModel(cartManager: cartManager, orderManager: orderManager))) {
                            CartButton(numberOfProducts: cartManager.totalCount)
                        }
                }
            }
            .onAppear {
                // Вызываем fetchProducts при загрузке SellerProductsCatalogView
                isLoading = true
                SellerProductsManager.shared.fetchProducts {
                    isLoading = false
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}
