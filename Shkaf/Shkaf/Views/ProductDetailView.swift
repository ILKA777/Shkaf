//
//  ProductDetailView.swift
//  Shkaf
//
//  Created by Илья on 15.03.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @Binding var isPresented: Bool
    @State private var isCartViewPresented = false
    @EnvironmentObject var cartManager: CartManager
    @State private var isAddedToCart: Bool = false
    
    var body: some View {
        VStack {
            // Фотография товара
            VStack {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                Spacer()
                
            }
            
            // Цена и описание товара
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                Text("\(product.price) ₽")
                    .font(.title)
                    .bold()
                Text(product.description)
                    .font(.body)
                    .bold()
            }
            .offset(y: -50)
            //.padding(.top)
            .offset(x: -50)
            .padding([.horizontal, .bottom])
            
            

            if isAddedToCart {
       
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
                                .offset(y: -20)
                                .padding()
                                .sheet(isPresented: $isCartViewPresented) {
                                    CartView().environmentObject(cartManager)
                                }
                
            } else {
                Button(action: {
                    cartManager.addToCart(product: product)
                    isAddedToCart = true // Change the state to update the button
                }) {
                    Text("Добавить в корзину")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color(uiColor: .CustomGreen()))
                        .cornerRadius(10)
                }
                .offset(y: -20)
                
                .padding()
            }
            
            
            Spacer()
        }
        .navigationBarTitle(Text(product.name), displayMode: .inline)
        .navigationBarItems(trailing: Button("Закрыть") {
            isPresented = false
        })
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(product:productList[4])
//    }
//}
