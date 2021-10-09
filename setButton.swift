//
//  setButton.swift
//  SetGame
//
//  Created by Ashadur Omith on 9/30/20.
//  Copyright © 2020 Ashadur Omith. All rights reserved.
//

import Foundation
import UIKit

class setButton {
    
    private static func getShape(ofCard card: SetCard) -> String {
        switch card.shape {
        case .triangle:
            return "▲"
        case .circle:
            return "●"
        case .square:
            return "◼︎"
        }
    }
    
    private static func getColor(ofCard card: SetCard) -> UIColor {
        switch card.color {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .purple:
            return UIColor.purple
        }
    }
    
    private static func getButtonTitle(ofCard card: SetCard, usingShape shape: String) -> String {
        switch card.count{
        case .one:
            return shape
        case .two:
            return "\(shape) \(shape)"
        case .three:
            return "\(shape) \(shape) \(shape)"
        }
    }
    
    private static func getButtonAttributedTitle(ofCard card: SetCard, withTitle title: String, withColor color: UIColor) -> NSAttributedString {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        switch card.shade {
        case .outlined:
            attributes[.strokeWidth] = 4.0
            attributes[.foregroundColor] = color
        case .filled:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color.withAlphaComponent(1.0)
        case .striped:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color.withAlphaComponent(0.3)
            attributes[.strokeColor] = color.withAlphaComponent(1.0)
            
            
        }
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    
    
    public static func renderCard(cardToRender card: SetCard, onButton: UIButton, selectButton: Bool, isSet: Bool) {
        
        onButton.isHidden = false
        let buttonColor = getColor(ofCard: card)
        let cardSymbol = getShape(ofCard: card)
        let buttonTitle = getButtonTitle(ofCard: card, usingShape: cardSymbol)
        let attributedTitle = getButtonAttributedTitle(ofCard: card, withTitle: buttonTitle, withColor: buttonColor)
        
        onButton.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        
        
        
        if selectButton {
            if isSet {
                onButton.select(borderColor: #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
            } else {
                onButton.select()
                onButton.select(borderColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
            }
        } else {
            onButton.deselect()
        }
    }
}
