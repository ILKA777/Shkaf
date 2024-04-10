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

var brandList: [Brand] = [Brand(categoty: "Одежда и обувь", name: "2moods", description: "Молодой российский бренд", image: "12storeez"),
                          Brand(categoty: "Одежда и обувь", name: "Sela", description: "Молодой российский бренд", image: "fable"),
                          Brand(categoty: "Одежда и обувь", name: "IrOzone", description: "Молодой российский бренд", image: "gate31"),
                          Brand(categoty: "Одежда и обувь", name: "Haliky", description: "Молодой российский бренд", image: "haliky"),
                          Brand(categoty: "Одежда и обувь", name: "Pravilamag", description: "Молодой российский бренд", image: "lime"),
                          Brand(categoty: "Одежда и обувь", name: "Idol", description: "Молодой российский бренд", image: "omanko"),
                          Brand(categoty: "Одежда и обувь", name: "LoveRepublic", description: "Молодой российский бренд", image: "shu"),
                          Brand(categoty: "Одежда и обувь", name: "Aimclo", description: "Молодой российский бренд", image: "zny")]
