//
//  MyPurchasesView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct MyPurchasesView: View {
    // Пример списка заказов
    @EnvironmentObject var orderManager: OrderManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(orderManager.orders, id: \.id) { order in
                        OrderRow(order: order)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Мои покупки"), displayMode: .large)
        .navigationBarTitleDisplayMode(.large)
        .frame(maxWidth: .infinity)
    }
}

struct MyPurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        MyPurchasesView()
    }
}
