//
//  DeliveryRow.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import SwiftUI

struct DeliveryRow: View {
    var deliveryInfo: DeliveryInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text((deliveryInfo.clientName ?? "Имя") + " " + (deliveryInfo.clientSurname ?? "Фамилия"))
                .font(.system(size: 25))
                .bold()
                
            Text(deliveryInfo.clientAddress ?? "Адрес")
                .font(.system(size: 22))
                .bold()
                
            Text(deliveryInfo.clientPhone ?? "Телефон")
                .font(.system(size: 20))
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .CustomGreen())))
        .padding(.horizontal, 0)
    }
}


//#Preview {
//    DeliveryRow(deliveryInfo: DeliveryInfo(cleintName: "Илья", clientSurname: "Морин", clientPhone: "+7(965)202-22-22", clientAddress: "Москва ул. Тверская д.4"))
//}
