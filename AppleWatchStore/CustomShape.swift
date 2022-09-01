//
//  CustomShape.swift
//  AppleWatchStore
//
//  Created by Temiloluwa on 01/09/2022.
//  Copyright © 2022 Tello. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        
        return Path{  path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 40 ))
            
            
        }
    }
}

// menu Buttons

var menu  = ["ALL", "CLASSIC", "GRAND", "FORMAL", "ORIGINAL", "TREND"]
// sample watch data


struct Watch: Identifiable, Hashable {
    
    var id: Int
    var color: String
    var price: String
    var image: String
    var title: String
}
var data = [  Watch(id: 0, color: "White", price: "$650", image: "white", title: "Classic White"),
              Watch(id: 1, color: "Black", price: "500", image: "black", title: "Classic Black"),
              Watch(id: 2, color: "Gold", price: "$750", image: "gold", title: "Classic Gold"),
              Watch(id: 3, color: "Red", price: "$500", image: "red", title: "Classic Red"),
              Watch(id: 4, color: "Yellow", price: "500", image: "yellow", title: "Classic Yellow")]

