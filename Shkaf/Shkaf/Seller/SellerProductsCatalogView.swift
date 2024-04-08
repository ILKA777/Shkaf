//
//  SellerProductCatalogView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerProductsCatalogView: View {
    
    @State private var isShowingProductDetail = false
    @State private var selectedProduct: Product?
    @State private var isShowingSearch = false
    @State private var searchText = ""
    
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
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(SellerProductsManager.shared.productList.filter {
                            searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                        }, id: \.id) { product in
                            SellerProductCard(product: product, status: .forSale)
                                .onTapGesture {
                                    selectedProduct = product
                                    isShowingProductDetail = true
                                }
                                .sheet(item: $selectedProduct) { product in
                                    ProductDetailView(product: product)
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("Мои товары"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation { isShowingSearch.toggle() }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}
