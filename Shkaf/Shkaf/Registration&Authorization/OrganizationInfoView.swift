//
//  SellerRegistrationView.swift
//  Shkaf
//
//  Created by Илья on 17.02.2024.
//

import SwiftUI

struct OrganizationInfoView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var patronymic: String = ""
    @State private var birthday: String = ""
    @State private var typeOfOrganization: String = ""
    @State private var organizationNumber: String = ""
    @State private var region: String = ""
    @State private var organizationName: String = ""
    @State private var productCategoryName: String = ""
    @State private var isMale = true
    
    @State private var isSellerRegistrationViewPresented = false
    var body: some View {
        VStack(alignment: .center) {
            Text("Информация об организации")
                .font(.title2)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .lineLimit(1)
            
            TextField("Имя", text: $name)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Фамилия", text: $surname)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Отчество", text: $patronymic)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            Text("Пол:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: 10, y: 10)
            
            Picker("", selection: $isMale) {
                Text("Мужской").tag(true)
                Text("Женский").tag(false)
            }
            .frame(width: 350)
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TextField("Дата рождения", text: $birthday)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Тип организации", text: $typeOfOrganization)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("ИНН организации", text: $organizationNumber)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Регион работы", text: $region)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Юридическое название компании", text: $organizationName)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            TextField("Категория продаваемых товаров", text: $productCategoryName)
                .padding()
                .frame(width: 350, height: 40)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            NavigationLink(destination: SellerRegistrationView(), isActive: $isSellerRegistrationViewPresented) {
                EmptyView()
            }
            Button(action: {
                withAnimation {
                    isSellerRegistrationViewPresented.toggle()
                }
            })
            {
                Text("Далее")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .CustomGreen()))
                    .cornerRadius(10)
                    .frame(height: 50)
                    .offset(y: 30)
            }
        }
        .padding()
    }
}

#Preview {
    OrganizationInfoView()
}
