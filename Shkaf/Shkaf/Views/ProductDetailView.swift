//
//  ProductDetailView.swift
//  Shkaf
//
//  Created by Илья on 15.03.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @State private var isCartViewPresented = false
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @State private var isAddedToCart: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Фотография товара
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .clipped() // Обрезаем изображение по размеру фрейма
            
            // Описание товара
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 5) // Отступ снизу для разделения текста
                Text("\(product.price.formattedPrice) ₽")
                    .font(.title)
                    .bold()
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding([.horizontal, .bottom])
            
            // Кнопка добавления в корзину или перехода в корзину
            if isAddedToCart {
                NavigationLink(
                    destination: CartView()
                        .environmentObject(cartManager)
                        .environmentObject(OrderViewModel(cartManager: cartManager, orderManager: orderManager)),
                    isActive: $isCartViewPresented
                ) {
                    EmptyView()
                }
                .isDetailLink(false)
                
                Button(action: {
                    isCartViewPresented = true
                }) {
                    Text("Перейти в корзину")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Button(action: {
                    cartManager.addToCart(product: product)
                    isAddedToCart = true // Обновление состояния для изменения кнопки
                }) {
                    Text("Добавить в корзину")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .CustomGreen()))
                        .cornerRadius(10)
                }
                .padding()
            }
            
            Spacer() // Для выравнивания содержимого вверху
        }
    }
}

public extension Double {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productList[6])
            .environmentObject(CartManager())
    }
}
