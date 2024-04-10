//
//  MySalesView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//


import SwiftUI

struct MySalesView: View {
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
        .navigationBarTitle(Text("Мои продажи"), displayMode: .large)
        .navigationBarTitleDisplayMode(.large)
        .frame(maxWidth: .infinity)
    }
}

struct MySalesView_Previews: PreviewProvider {
    static var previews: some View {
        MySalesView()
    }
}
