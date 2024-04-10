//
//  NotificationsView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Здесь будут твои уведомления")
                .font(.headline)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Уведомления", displayMode: .inline)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
