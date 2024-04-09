//
//  SellerProductsManager.swift
//  Shkaf
//
//  Created by Илья on 07.04.2024.
//

import SwiftUI

struct ProductResponse: Codable {
    let id: Int
    let title: String
    let seller: String
    let price: Double
    let description: String
    let imageUrl: String
}



//class SellerProductsManager: ObservableObject {
//    
//    @Published var productList = [Product(category: "Одежда", name: "Orange sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/f9bffd2099a79590d458b9be471fcab276817a5df9bc4cade41d3d75940c6e76/6612cb4d/hPOLMzj86aniNSBCuAOjWT07SSht2zIZtM-CwvMCw-ft3korpWjUU1ZoIGwbxzPPA5iDHLA_BIRKlih-vHLI_w%3D%3D?uid=0&filename=sweater1.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2518x1308", price: 121.0),
//                                     Product(category: "Одежда", name: "Red sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/de59096eed840821fe4616dd4e98ba1ae612250058e27d73982b84d96c52c9e8/6612cbdb/B3qUxxkBsRyrjMI6BcNeYALthpJLWzZikgCiY22uImR11CdVPsq9TmreJJAfjN9bLs3AtlKV9j9UqsIfO7PvAw%3D%3D?uid=0&filename=sweater2.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 99.0),
//                                     Product(category: "Одежда", name: "Blue sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/f2e55f593187633089b66e787bf54d3e14485f46cd61a6b80f3b38d06108f4d3/6612cbec/Hwqay_2uUm-zUr7fz138RVqOQxE6V4Gfm6irJSolo4BDutXpy8uyRSzzBxj_XytfKPnRvaDyO2fvQoCNWFhj-w%3D%3D?uid=0&filename=sweater3.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 45.0),
//                                     Product(category: "Одежда", name: "Green sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/78560b4eee67736ef48d157de1e7a98e76c3f0c1fbea423124f62a14b8f94714/6612cbfb/IUrXja8JIROWA1-z-u2o2-jRRfODanlskC09xlQ6qJpZExt7UgimykXPrAuum507u_tYcv5flAzIaIGj4y0_Aw%3D%3D?uid=0&filename=sweater4.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 89.0),
//                                     Product(category: "Одежда", name: "Brown sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/9b25f2cfacda8ad50b04f8398cb38880f5fd2a6ab5c33cc55b97773c2041db7a/6612cc08/OPUrG79bMMl0DqKIsS8JbGLjmIxRFmSzW-_Uq2_vGIxBZxFuTtq3jvNXw2hb3zRZUCpyJgPf0ruGp5Jdh2O6dQ%3D%3D?uid=0&filename=sweater5.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 201.0),
//                                     Product(category: "Одежда", name: "Yellow sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/280c86aa09e104e2dd8b1af2bb386d0b915def709c5da0ece8d0ff38066a4502/6612cc14/d-5-UH3trrpzbWbG2aoqnU_N3C1gkMdVf-JXjt8RPMT7wv2g2Mh3JRfpC1qRcdk5muyhaShFcawl_0orVzpM8A%3D%3D?uid=0&filename=sweater6.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 23.0),
//                                     Product(category: "Одежда", name: "White sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/35489095f034c565b5e68c4cec423a253ca97217f94856fc408c0e26bb1bdddb/6612cc20/8ZEmu5mVdgjiEpHfZFgKDHYle3UyIIxKCs3Ltr_FMBkn5A99rljUF7DtU4r8Dpkm5Musqwj5QCAOtWXuPTwLuA%3D%3D?uid=0&filename=sweater7.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 48.0),
//                                     Product(category: "Одежда", name: "Cream sweater", description: "Свитер", image: "https://downloader.disk.yandex.ru/preview/d8049694b252cb277c7665b4be2163e0eda607dd2931002a241c4afe4581c1a7/6612cc2c/tBbXIbxcLchz8jDLGZZpYmOFVTGEhkMOjqgOnzksKVPlXx7Vad1G1QgDyHznVN1LHac1uU9GmXSDrvj6LYDxsA%3D%3D?uid=0&filename=sweater8.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=0&tknv=v2&size=2048x2048", price: 98.0)]
//
//    
//    static let shared = SellerProductsManager()
//    
//    
//
//    func addProduct(category: String, name: String, description: String, image: String, price: Double) {
//        let newProduct = Product(category: category, name: name, description: description, image: image, price: price)
//        productList.append(newProduct)
//    }
//}

 

class SellerProductsManager: ObservableObject {
    
    @Published var productList = [Product]()
    static let shared = SellerProductsManager()
    
    func fetchProducts(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:8090/products/all") else {
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { completion() } // Вызываем completion после завершения загрузки, в любом случае
            
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let products = try JSONDecoder().decode([ProductResponse].self, from: data)
                DispatchQueue.main.async {
                    self.productList = products.map {
                        Product(category: "Одежда",
                                name: $0.title,
                                description: $0.description,
                                image: $0.imageUrl,
                                price: $0.price)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func addProduct(category: String, name: String, description: String, image: String, price: Double) {
        let newProduct = Product(category: category, name: name, description: description, image: image, price: price)
        productList.append(newProduct)
    }
}
