//
//  SellerOrderRow.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerOrderRow: View {
    var order: Order
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        NavigationLink(destination: OrderCompositionView(order: order)) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Заказ №\(order.id)")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .bold()
                
                Text("Состав заказа:")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.bottom, 4)
                
                ForEach(order.productList) { productWithQuantity in
                    Text("\(productWithQuantity.product.name): \(productWithQuantity.product.price, specifier: "%.2f") руб.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
                
                Text("Информация о доставке:")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top, 8)
                
                Text("Имя: \(order.deliveryInfo.cleintName)")
                    .foregroundColor(.black)
                Text("Фамилия: \(order.deliveryInfo.clientSurname)")
                    .foregroundColor(.black)
                Text("Телефон: \(order.deliveryInfo.clientPhone)")
                    .foregroundColor(.black)
                Text("Email: \(order.deliveryInfo.clientEmail)")
                    .foregroundColor(.black)
                Text("Город: \(order.deliveryInfo.clientCity)")
                    .foregroundColor(.black)
                Text("Адрес: \(order.deliveryInfo.clientAddress)")
                    .foregroundColor(.black)
                
                Text("Стоимость: \(order.total, specifier: "%.2f") руб.")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.top, 8)
                
                Text("Дата заказа: \(dateFormatter.string(from: order.date))")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .bold()
                    .padding(.bottom, 8)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: .CustomGreen())))
            .padding(.horizontal, 0)
        }
    }
}

struct SellerOrderRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockProduct1 = Product( category: "Category 1", name: "Product 1", description: "Description 1", image: "https://downloader.disk.yandex.ru/preview/f9bffd2099a79590d458b9be471fcab276817a5df9bc4cade41d3d75940c6e76/6612cb4d/hPOLMzj86aniNSBCuAOjWT07SSht2zIZtM-CwvMCw-ft3korpWjUU1ZoIGwbxzPPA5iDHLA_BIRKlih-vHLI_w%3D%3D?uid=0&filename=sweater1.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2518x1308", price: 10.0)
        let mockProduct2 = Product( category: "Category 2", name: "Product 2", description: "Description 2", image: "https://downloader.disk.yandex.ru/preview/de59096eed840821fe4616dd4e98ba1ae612250058e27d73982b84d96c52c9e8/6612cbdb/B3qUxxkBsRyrjMI6BcNeYALthpJLWzZikgCiY22uImR11CdVPsq9TmreJJAfjN9bLs3AtlKV9j9UqsIfO7PvAw%3D%3D?uid=0&filename=sweater2.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 20.0)
        
        let mockDeliveryInfo = DeliveryInfoMock(cleintName: "John", clientSurname: "Doe", clientPhone: "123456789", clientEmail: "john@example.com", clientCity: "City", clientAddress: "Address")
        
        let mockOrder = Order( total: 30.0, productList: [ProductWithQuantity(product: mockProduct1, quantity: 1), ProductWithQuantity(product: mockProduct2, quantity: 2)], deliveryInfo: mockDeliveryInfo, date: Date())
        
        return SellerOrderRow(order: mockOrder)
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
