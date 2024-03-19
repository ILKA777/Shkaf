//
//  SplashScreenView.swift
//  Shkaf
//
//  Created by Илья on 17.03.2024.
//

import SwiftUI

struct SplashScreenView: View {

   
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("ShkafLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
       
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
