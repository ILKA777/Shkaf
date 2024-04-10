//
//  OrderCompositionView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

enum OrderStatus: String, CaseIterable {
    case accepted = "Принят"
    case assembling = "В сборке"
    case inTransit = "Передан в доставку"
    case completed = "Завершен"
}

struct OrderCompositionView: View {
    var order: Order
    @State private var selectedStatus: OrderStatus = .accepted
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(order.productList) { productWithQuantity in
                    ProductRowForOrders(product: productWithQuantity.product)
                }
                
                Text("Информация о доставке:")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top, 8)
                    .offset(x: -50, y: 20)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Имя: \(order.deliveryInfo.cleintName)")
                    Text("Фамилия: \(order.deliveryInfo.clientSurname)")
                    Text("Телефон: \(order.deliveryInfo.clientPhone)")
                    Text("Email: \(order.deliveryInfo.clientEmail)")
                    Text("Город: \(order.deliveryInfo.clientCity)")
                    Text("Адрес: \(order.deliveryInfo.clientAddress)")
                }
                .offset(x: -70, y: 40)
                .foregroundColor(.black)
                
                Text("Стоимость: \(order.total, specifier: "%.2f") руб.")
                    .font(.system(size: 18))
                
                    .bold()
                    .padding(.top, 8)
                    .offset(x: -70, y: 50)
                    .foregroundColor(.black)
                
                Text("Дата заказа: \(dateFormatter.string(from: order.date))")
                    .font(.system(size: 17))
                    .bold()
                    .padding(.bottom, 8)
                    .offset(x: -60, y: 50)
                
                HStack {
                    Text("Статус заказа:")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(selectedStatus.rawValue)
                        .foregroundColor(.black)
                }
                .padding(.top, 60)
                
                Picker("Изменить статус", selection: $selectedStatus) {
                    ForEach(OrderStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .accentColor(.black)
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom, 20)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.white))
            .padding(.horizontal, 0)
        }
        .navigationBarTitle("Состав заказа")
    }
}

struct OrderCompositionView_Previews: PreviewProvider {
    static var previews: some View {
        let mockProduct1 = Product(category: "Category 1", seller: "селлер", name: "Product 1", description: "Description 1", image: "https://www.charuel.ru/upload/iblock/ae9/jz6ig4g64nmzyb3te273r42k6opn3vu1.jpg", price: 10.0)
        let mockProduct2 = Product(category: "Category 2", seller: "селлер", name: "Product 2", description: "Description 2", image: "https://ledysoveti.ru/wp-content/uploads/2021/10/5-modnyj-delovoj-stil-odezhdy-21.jpg", price: 20.0)
        
        let mockDeliveryInfo = DeliveryInfoMock(cleintName: "John", clientSurname: "Doe", clientPhone: "123456789", clientEmail: "john@example.com", clientCity: "City", clientAddress: "Address")
        
        let mockOrder = Order(total: 30.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 1), ProductWithQuantity(product: mockProduct2, quantity: 2)], deliveryInfo: mockDeliveryInfo, date: Date())
        
        return OrderCompositionView(order: mockOrder)
    }
}
