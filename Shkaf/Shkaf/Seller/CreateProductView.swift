//
//  CreateProductView.swift
//  Shkaf
//
//  Created by Илья on 24.03.2024.
//

import SwiftUI

struct CreateProductView: View {
    @State private var productCategory = ""
    @State private var productName = ""
    @State private var productURL = ""
    @State private var productPrice = ""
    @State private var productDescription = ""
    @State private var selectedImage: Image?
    @State private var isImagePickerPresented = false
    @State private var isSourceSelectionSheetPresented = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                // Action to open image picker
                isSourceSelectionSheetPresented = true
            }) {
                if let selectedImage = selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .foregroundColor(Color(uiColor: .CustomGreen()))
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
            
            TextField("Категория товара", text: $productCategory)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Название товара", text: $productName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Стоимость товара", text: $productPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("URL фотографии", text: $productURL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextEditor(text: $productDescription)
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            
            Button(action: {
                // Action to publish product
                // Implement your logic here
                let price = Double(productPrice) ?? 0.0
                SellerProductsManager.shared.addProduct(category: productCategory, name: productName, description: productDescription, image: productURL, price: price)
            }) {
                Text("Опубликовать товар")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Создание товара")
    }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView()
    }
}
