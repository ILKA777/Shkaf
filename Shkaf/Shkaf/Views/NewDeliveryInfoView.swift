//
//  NewDeliveryInfoView.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import SwiftUI

struct NewDeliveryInfoView: View {
    @Binding var showModal: Bool
    
    var didDismiss: () -> Void
    
    @State private var clientName = ""
    @State private var clientSurname = ""
    @State private var clientPhone = ""
    @State private var clientEmail = ""
    @State private var clientCity = ""
    @State private var clientAddress = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Имя клиента", text: $clientName)
                TextField("Фамилия клиента", text: $clientSurname)
                TextField("Телефон клиента", text: $clientPhone)
                TextField("Почта клиента", text: $clientEmail)
                TextField("Город доставки", text: $clientCity)
                TextField("Адрес доставки", text: $clientAddress)
            }
            .navigationBarItems(leading: Button("Отмена") {
                showModal = false
            }, trailing: Button("Сохранить") {
                DeliveryInfoCoreDataManager.shared.saveDeliveryInfoToCoreData(clientName: clientName,
                                                                              clientSurname: clientSurname,
                                                                              clientPhone: clientPhone,
                                                                              clientEmail: clientEmail,
                                                                              clientCity: clientCity,
                                                                            clientAddress: clientAddress)
                didDismiss()
                showModal = false
                
            })
            .navigationTitle("Адрес доставки")
        }
    }
}
