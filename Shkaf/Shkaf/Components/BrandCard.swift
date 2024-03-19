//
//  BrandCard.swift
//  Shkaf
//
//  Created by Илья on 19.03.2024.
//

import SwiftUI

struct BrandCard: View {
   
    var brand: Brand
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(brand.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(brand.name)
                        .bold()
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
            .frame(width: 180, height: 220)
            .shadow(radius: 3)
            
        }
    }
}

#Preview {
    BrandCard(brand: brandList[1])
}
