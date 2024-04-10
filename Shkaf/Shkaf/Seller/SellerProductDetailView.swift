//
//  SellerProductDetailView.swift
//  Shkaf
//
//  Created by Илья on 08.04.2024.
//

import SwiftUI

struct SellerProductDetailView: View {
    @State private var remainingQuantity = 11
    @State private var isEditing = false
    @State private var isSaved = false
    @State private var isWithdrawn = false
    
    var product: Product
    @State private var isCartViewPresented = false
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var orderManager: OrderManager
    @State private var isAddedToCart: Bool = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Product Image
            AsyncImage(url: URL(string: product.image)!) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 400)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .clipped()
                case .failure:
                    Image("ShkafLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.gray)
                        .frame(height: 400)
                        .clipped()
                }
            }
            
            // Product Details
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 5)
                Text("\(product.price.formattedPrice) ₽")
                    .font(.title)
                    .bold()
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                if !isWithdrawn {
                    HStack {
                        if isEditing {
                            TextField("Остаток", value: $remainingQuantity, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .padding(.horizontal)
                            
                            Button(action: {
                                // Save changes action
                                isSaved = true
                                isEditing = false
                            }) {
                                Text("Сохранить")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.trailing)
                        } else {
                            Text("Остаток: \(remainingQuantity)")
                                .padding(.horizontal)
                            
                            Button(action: {
                                isEditing = true
                            }) {
                                Text("Изменить")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.trailing)
                        }
                        
                        Button(action: {
                            isWithdrawn = true
                            deleteProduct(productId: product.localId!)
                        }) {
                            Text("Снять с продажи")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        
            Spacer()
        }
        .onAppear {
            // Fetching products
            isLoading = true
            SellerProductsManager.shared.fetchProducts {
                isLoading = false
            }
        }
    }
    
    private func deleteProduct(productId: Int) {
            guard let url = URL(string: "http://localhost:8090/products/\(productId)") else {
                print("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            // Set JWT token in the Authorization header if required
             guard let userToken = UserManager.shared.currentUser.userToken else {
                 return
             }
             request.addValue("Bearer \(userToken)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    
                    if httpResponse.statusCode == 200 {
                        print("Product successfully deleted!")
                        DispatchQueue.main.async {
                            isWithdrawn = true
                        }
                    } else {
                        print("Failed to delete product. HTTP Status Code: \(httpResponse.statusCode)")
                        // Handle failure action if needed
                    }
                }
            }.resume()
        }
}

struct SellerProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SellerProductDetailView(product: SellerProductsManager.shared.productList[6])
            .environmentObject(CartManager())
    }
}
