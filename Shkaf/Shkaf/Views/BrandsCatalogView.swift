//
//  BrandsListView.swift
//  Shkaf
//
//  Created by Илья on 19.03.2024.
//

import SwiftUI

struct BrandsCatalogView: View {

    @State private var selectedBrand: Brand?
    @State private var isShowingSearch = false
    @State private var searchText = ""
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                if isShowingSearch {
                    TextField("Поиск брендов...", text: $searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(brandList.filter {
                            searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                        }, id: \.id) { brand in
                            BrandCard(brand: brand)
                                .onTapGesture {
                                    selectedBrand = brand
                                    
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("Бренды"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
}


#Preview {
    BrandsCatalogView()
}
