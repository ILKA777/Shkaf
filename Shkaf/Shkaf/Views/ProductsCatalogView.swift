//
//  ProfuctsCatalogView.swift
//  Shkaf
//
//  Created by Илья on 08.02.2024.
//

import SwiftUI

struct ProductsCatalogView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Binding var showMenu: Bool
    
    @State private var isShowingProductDetail = false
    @State private var selectedProduct: Product?
    @State private var isShowingSearch = false // To toggle search bar visibility
    @State private var searchText = "" // To hold the search text
    
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
                
                BrandsCarouselView()
                    .padding(.bottom)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList.filter {
                            searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                        }, id: \.id) { product in
                            ProductCard(product: product)
                                .onTapGesture {
                                    selectedProduct = product
                                    isShowingProductDetail = true
                                }
                                .sheet(item: $selectedProduct) { product in
                                    ProductDetailView(product: product, isPresented: $isShowingProductDetail)
                                }
                                .environmentObject(cartManager)
                                .environmentObject(favoritesManager)
                        }
                    }
                    .padding()
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
                    
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
