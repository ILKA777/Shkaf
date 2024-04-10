//
//  SettingsView.swift
//  Shkaf
//
//  Created by Илья on 03.03.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var isRussian = true
    @State private var notificationsEnabled = true
    
    var body: some View {
        VStack {
            Text("Язык:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: 20, y: 10)
            
            Picker("", selection: $isRussian) {
                Text("Русский").tag(true)
                Text("English").tag(false)
            }
            .frame(width: 350)
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Toggle("уведомления", isOn: $notificationsEnabled)
                .padding()
            
            Button(action: {
                // Действие по удалению аккаунта
            }) {
                Text("Удалить аккаунт")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .navigationBarTitle("Настройки", displayMode: .large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

