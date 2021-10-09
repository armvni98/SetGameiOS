//
//  setCard.swift
//  SetGame
//
//  Created by Ashadur Omith on 9/28/20.
//  Copyright © 2020 Ashadur Omith. All rights reserved.
//

import Foundation
import UIKit

struct SetCard: Equatable {
    
    
    var shape : Shapes
    var shade : Shades
    var color : Colors
    var count : Count
    
    var isSelected = false
    var isMatched  = false
    var isMisMatch = false
    
    
    
    enum Shapes{
        case triangle
        case circle
        case square
        
        static var all = [Shapes.triangle, .circle, .square]
    }
    
    
    enum Shades{
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined, .striped, .filled]
    }
    
    enum Colors{
        case green
        case red
        case purple
        
        static var all = [Colors.green, .red, .purple]
    }
    
    enum Count{
        case one
        case two
        case three
        
        static var all = [Count.one, two, three]
    }
    
    init(shape: Shapes, shade: Shades, color: Colors, count: Count) {
        self.shape = shape
        self.shade = shade
        self.color = color
        self.count = count
    }
}

extension SetCard {                         //Determine if left card and right
    //card is equal
    static func == (lhs: SetCard, rhs: SetCard) -> Bool {
        return  (lhs.shape == rhs.shape) &&
            (lhs.color == rhs.color) &&
            (lhs.shade == rhs.shade) && (lhs.count == rhs.count)
    }
}

