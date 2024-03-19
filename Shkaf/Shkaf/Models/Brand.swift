//
//  Brand.swift
//  Shkaf
//
//  Created by Илья on 19.03.2024.
//

import Foundation

struct Brand: Identifiable, Hashable {
    var id = UUID()
    var categoty: String
    var name: String
    var description: String
    var image: String
}

var brandList: [Brand] = [Brand(categoty: "Одежда и обувь", name: "12storeez", description: "Молодой российский бренд", image: "12storeez"),
                          Brand(categoty: "Одежда и обувь", name: "Fable", description: "Молодой российский бренд", image: "fable"),
                          Brand(categoty: "Одежда и обувь", name: "Gate31", description: "Молодой российский бренд", image: "gate31"),
                          Brand(categoty: "Одежда и обувь", name: "Haliky", description: "Молодой российский бренд", image: "haliky"),
                          Brand(categoty: "Одежда и обувь", name: "Lime", description: "Молодой российский бренд", image: "lime"),
                          Brand(categoty: "Одежда и обувь", name: "Omanko", description: "Молодой российский бренд", image: "omanko"),
                          Brand(categoty: "Одежда и обувь", name: "Shu", description: "Молодой российский бренд", image: "shu"),
                          Brand(categoty: "Одежда и обувь", name: "Zny", description: "Молодой российский бренд", image: "zny")]
//let icons: [String] = ["12storeez", "fable", "gate31", "haliky", "lime", "omanko", "shu", "zny"]
