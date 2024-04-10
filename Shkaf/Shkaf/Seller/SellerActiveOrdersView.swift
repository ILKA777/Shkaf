//
//  SellerActiveOrdersView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerActiveOrdersView: View {
    // Пример списка заказов
    @EnvironmentObject var orderManager: OrderManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(orderManager.orders, id: \.id) { order in
                        SellerOrderRow(order: order)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationBarTitle(Text("Активные заказы"), displayMode: .large)
        }
        .navigationBarTitleDisplayMode(.large)
        .frame(maxWidth: .infinity)
    }
}

struct SellerActiveOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        SellerActiveOrdersView()
    }
}
