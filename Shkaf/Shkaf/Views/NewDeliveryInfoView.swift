//
//  NewDeliveryInfoView.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import SwiftUI

struct NewDeliveryInfoView: View {
    @Binding var showModal: Bool
    @Binding var deliveries: [DeliveryInfo]
    
    @State private var clientName = ""
    @State private var clientSurname = ""
    @State private var clientPhone = ""
    @State private var clientAddress = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Имя клиента", text: $clientName)
                TextField("Фамилия клиента", text: $clientSurname)
                TextField("Телефон клиента", text: $clientPhone)
                TextField("Адрес доставки", text: $clientAddress)
            }
            .navigationBarItems(leading: Button("Отмена") {
                showModal = false
            }, trailing: Button("Сохранить") {
                let newDelivery = DeliveryInfo(cleintName: clientName, clientSurname: clientSurname, clientPhone: clientPhone, clientAddress: clientAddress)
                deliveries.append(newDelivery)
                showModal = false
            })
            .navigationTitle("Адрес доставки")
        }
    }
}
//
//#Preview {
//    NewDeliveryInfoView()
//}
