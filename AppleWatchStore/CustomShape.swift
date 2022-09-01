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

