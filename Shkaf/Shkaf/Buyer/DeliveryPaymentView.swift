//
//  DeliveryPaymentView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct DeliveryPaymentView: View {
    @State private var deliveries = [DeliveryInfo]()
    @State private var showingModal = false
    
    var body: some View {
        VStack {
            List(deliveries) { deliveryInfo in
                DeliveryRow(deliveryInfo: deliveryInfo)
            }
            .refreshable {
                loadDeliveries()
            }
            .onAppear {
                // Загрузка данных при появлении представления
                loadDeliveries()
            }
            Spacer()
        }
        .navigationBarTitle("Доставка и оплата", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            showingModal = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingModal) {
            NewDeliveryInfoView(showModal: $showingModal, didDismiss: {
                // Обновление данных или перезагрузка представления после закрытия NewDeliveryInfoView
                loadDeliveries()
            })
        }
    }
    
    private func loadDeliveries() {
        // Загрузка данных о доставках
        deliveries = DeliveryInfoCoreDataManager.shared.fetchDeliveryInfo()
    }
}

struct DeliveryPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryPaymentView()
    }
}

