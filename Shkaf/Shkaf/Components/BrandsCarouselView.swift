//
//  BrandsCarouselView.swift
//  Shkaf
//
//  Created by Илья on 19.03.2024.
//

import SwiftUI

struct BrandsCarouselView: View {
    var brandList: [Brand]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(brandList) { brand in
                    NavigationLink(destination: SellerProductsView(seller: brand.name)) {
                        // При нажатии на кнопку открывается SellerProductsView с товарами этого продавца
                        Image(brand.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 62)
                            .background(Circle().fill(Color.white))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.primary, lineWidth: 1))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
