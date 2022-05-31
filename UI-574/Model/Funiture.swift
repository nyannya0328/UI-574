//
//  Funiture.swift
//  UI-574
//
//  Created by nyannyan0328 on 2022/05/31.
//

import SwiftUI

struct Funiture: Identifiable {
    var id = UUID().uuidString
    var title : String
    var image : String
    var subTitle : String
    var price : String
}

var furnitures: [Funiture] = [
    Funiture(title: "Royal Palm Sofa", image: "Furniture1", subTitle: "Erogonomical for humans body curve.", price: "$299"),
    Funiture(title: "Modern Sofa", image: "Furniture2", subTitle: "Extra comfy chair with a palm rest.", price: "$499"),
    Funiture(title: "Leather Sofa", image: "Furniture3", subTitle: "Erogonomical for humans body curve.", price: "$199"),
    Funiture(title: "Luxary Sofa", image: "Furniture4", subTitle: "Extra comfy chair with a palm rest.", price: "$399"),
    Funiture(title: "Seto Sofa", image: "Furniture5", subTitle: "Erogonomical for humans body curve.", price: "$599")
]
