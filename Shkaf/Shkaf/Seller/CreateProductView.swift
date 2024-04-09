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
    @State private var isProductPublished = false
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
                let price = Double(productPrice) ?? 0.0
                publishProduct()
                isProductPublished = true
            }) {
                Text("Опубликовать товар")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $isProductPublished) {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.green)
                        .padding()

                    Text("Ваш товар опубликован")
                        .font(.headline)
                        .padding(.bottom)

                    Button("Закрыть", action: {
                        isProductPublished = false
                    })
                    .padding()
                    .foregroundColor(.blue)
                }
                .padding()
            }


            
            Spacer()
        }
        .padding()
        .navigationTitle("Создание товара")
    }
    
    private func publishProduct() {
            guard let url = URL(string: "http://localhost:8090/products/new") else {
                print("Invalid URL")
                return
            }
            
            let price = Double(productPrice) ?? 0.0
            
            let productData: [String: Any] = [
                "title": productName,
                "seller": "Продавец", // Update with your seller identifier or name
                "price": Int(productPrice) ?? 0,
                "description": productDescription,
                "imageUrl": productURL
            ]
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: productData) else {
                print("Failed to serialize product data")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Set JWT token in the Authorization header
        guard let userToken = UserManager.shared.currentUser.userToken else {
            return
        }
        request.addValue("Bearer \(userToken)", forHTTPHeaderField: "Authorization")
            
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    
                    if httpResponse.statusCode == 200 {
                        print("Product successfully published!")
                        // Handle success action if needed
                    } else {
                        print("Failed to publish product. HTTP Status Code: \(httpResponse.statusCode)")
                        // Handle failure action if needed
                    }
                }
            }.resume()
        }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView()
    }
}
