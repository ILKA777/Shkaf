//
//  OrderRow.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import SwiftUI

struct OrderRow: View {
    var order: Order
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Заказ №\(order.id)")
                .font(.system(size: 18))
                .bold()
                
                
            Text("Стоимость: \(order.total, specifier: "%.2f") руб.")
                .font(.system(size: 16))
                .bold()
                
            Text("Дата: \(dateFormatter.string(from: order.date))")
                .font(.system(size: 14))
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
//    OrderRow(order: Order(id: 111, total: 100, date: Date()))
//}
