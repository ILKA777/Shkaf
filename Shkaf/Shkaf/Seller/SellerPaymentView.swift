//
//  SellerPaymentView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerPaymentView: View {
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
        .navigationBarTitle("Реквизиты", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            showingModal = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingModal) {
            PaymentDetailsView(showModal: $showingModal)
        }
    }
}

struct SellerPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SellerPaymentView()
    }
}

