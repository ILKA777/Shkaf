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
            ScrollView {
                ForEach(deliveries) { deliveryInfo in
                    DeliveryRow(deliveryInfo: deliveryInfo)
                }
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
            NewDeliveryInfoView(showModal: $showingModal, deliveries: $deliveries)
        }
    }
}

struct DeliveryPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryPaymentView()
    }
}

