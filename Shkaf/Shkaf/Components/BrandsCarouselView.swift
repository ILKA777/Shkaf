//
//  BrandsCarouselView.swift
//  Shkaf
//
//  Created by Илья on 19.03.2024.
//

import SwiftUI

struct BrandsCarouselView: View {
    // Массив изображений или идентификаторов для кнопок
//    let icons: [String] = ["12storeez", "fable", "gate31", "haliky", "lime", "omanko", "shu", "zny"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(brandList, id: \.self) { brand in
                    Button(action: {
                        // Действие при нажатии на кнопку
                        print("\(brand.image) was tapped")
                    }) {
                        Image("\(brand.image)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 62)
                            .background(Circle().fill(.white))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.primary, lineWidth: 1))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    BrandsCarouselView()
}
