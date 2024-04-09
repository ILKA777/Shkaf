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
    @State private var isLoading = false
    
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
                
                // Отображение индикатора активности при загрузке
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(SellerProductsManager.shared.productList.indices, id: \.self) { index in
                                let product = SellerProductsManager.shared.productList[index]
                                let status = (index == SellerProductsManager.shared.productList.indices.last) ? ProductStatus.underModeration : ProductStatus.forSale
                                
                                SellerProductCard(product: product, status: status)
                                    .onTapGesture {
                                        selectedProduct = product
                                        isShowingProductDetail = true
                                    }
                                    .sheet(item: $selectedProduct) { product in
                                        SellerProductDetailView(product: product)
                                    }
                            }
                        }
                        .padding()
                    }
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
