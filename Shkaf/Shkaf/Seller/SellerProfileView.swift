//
//  SellerProfileView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct SellerProfileView: View {
    
    @EnvironmentObject var orderManager: OrderManager
    
    @State private var selectedImage: Image?
    @State private var isImagePickerPresented = false
    @State private var isSourceSelectionSheetPresented = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Верхняя часть с кружочком и фото
                
                HStack {
                    
                    Button(action: {
                        // Action to open image picker
                        isSourceSelectionSheetPresented = true
                    }) {
                        if let selectedImage = selectedImage {
                            selectedImage
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Image("cat-face")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                    .actionSheet(isPresented: $isSourceSelectionSheetPresented) {
                        ActionSheet(
                            title: Text("Выберите источник"),
                            buttons: [
                                .default(Text("Галерея")) {
                                    sourceType = .photoLibrary
                                    isImagePickerPresented = true
                                },
                                .default(Text("Камера")) {
                                    sourceType = .camera
                                    isImagePickerPresented = true
                                },
                                .cancel()
                            ]
                        )
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: $selectedImage, isSourceSelectionSheetPresented: $isSourceSelectionSheetPresented, sourceType: sourceType)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Название магазина")
                            .font(.headline)
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                            .foregroundColor(.primary)
                            .padding()
                    }
                    .offset(x: 170)
                    
                    Spacer()
                }
                .padding()
                .offset(x: 10)
                
                // Label и кнопки
                VStack(alignment: .leading, spacing: 20) {
                    Text("мой кабинет")
                        .font(.system(size: 32))
                        .bold()
                        .padding()
                    
                    NavigationLink(destination: MySalesView().environmentObject(orderManager)) {
                        HStack {
                            Text("мои продажи")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -10)
                    
                    NavigationLink(destination: CreateProductView()) {
                        
                        HStack {
                            Text("Создать карточку товара")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -30)
                    
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Text("уведомления")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -50)
                    
                    NavigationLink(destination: SellerPaymentView()) {
                        HStack {
                            Text("реквизиты")
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.primary)
                        }
                        .padding()
                        
                    }
                    .offset(y: -70)
                    
                    NavigationLink(destination: ContentView()) {
                        HStack {
                            Text("Выйти из профиля")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                                .bold()
                            Image(systemName: "door.left.hand.open")
                                .foregroundColor(.red)
                        }
                        .padding()
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct SellerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SellerProfileView()
    }
}
