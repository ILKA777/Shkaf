//
//  FavoritesView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                if favoritesManager.products.count > 0 {
                    ForEach(favoritesManager.products, id: \.id) {
                        product in ProductRowFavorites(product: product)
                    }
                } else {
                    Text("У вас ничего нет в избранных")
                }
            }
            .navigationTitle("Избранное")
            .padding(.top)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager())
    }
}
