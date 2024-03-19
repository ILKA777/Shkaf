//
//  MyPurchasesView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct MyPurchasesView: View {
    // Пример списка заказов
    let orders: [Order] = [
        Order(id: 1, total: 1500.0, date: Date()),
        Order(id: 2, total: 2200.5, date: Date().addingTimeInterval(-86400)),
        Order(id: 3, total: 890.75, date: Date().addingTimeInterval(-172800))
    ]
    
    var body: some View {
        NavigationView { 
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(orders, id: \.id) { order in
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
