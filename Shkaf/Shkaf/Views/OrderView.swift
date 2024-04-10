//
//  OrderView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Binding var isPlacingOrder: Bool
    
    @State private var deliveryMethods: [DeliveryInfo] = []
    @State private var selectedDeliveryMethod: DeliveryInfo? = nil
    @State private var showingAddNewDelivery = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Cart section
                if viewModel.cartManager.products.count > 0 {
                    Text("Ваш заказ:")
                        .font(.headline)
                        .padding(.bottom)
                    
                    ForEach(viewModel.cartManager.products) { productWithQuantity in
                        ProductRow(productWithQuantity: productWithQuantity)
                    }
                    .padding(.bottom)
                } else {
                    Text("Ваша корзина пуста")
                        .padding(.bottom)
                }
                
                HStack {
                    Text("Выберите способ доставки:")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // Открываем интерфейс добавления нового способа доставки
                        showingAddNewDelivery = true
                    }) {
                        Text("Добавить новый")
                            .foregroundColor(.blue)
                    }
                    Button(action: {
                        // Открываем Picker для выбора из имеющихся способов доставки
                        showingAddNewDelivery = false
                    }) {
                        Text("Выбрать из имеющихся")
                            .foregroundColor(.blue)
                    }
                }
                
                if showingAddNewDelivery {
                    // Показываем поля для ввода новой информации о доставке
                    
                    TextField("Имя получателя", text: $viewModel.clientName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Фамилия получателя", text: $viewModel.clientSurname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Телефон получателя", text: $viewModel.clientPhone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Электронная почта", text: $viewModel.clientEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Город", text: $viewModel.clientCity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    TextField("Адрес", text: $viewModel.clientAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                } else {
                    // Показываем Picker для выбора способа доставки
                    Picker(selection: $selectedDeliveryMethod, label: Text("")) {
                        ForEach(deliveryMethods, id: \.self) { method in
                            Text(method.clientAddress ?? "")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(.bottom)
                }
                
                Button(action: {
                    viewModel.placeOrder()
                    viewModel.clearCart()
                    isPlacingOrder = false
                }) {
                    Text("Оформить заказ")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(uiColor: .CustomGreen()))
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle(Text("Order Details"))
        .padding(.top)
        .onAppear {
            // Загрузка списка способов доставки из DeliveryInfoCoreDataManager
            deliveryMethods = DeliveryInfoCoreDataManager.shared.fetchDeliveryInfo()
            
            if !deliveryMethods.isEmpty {
                selectedDeliveryMethod = deliveryMethods[0] // Выбор первого способа по умолчанию
            }
        }
    }
}
