//
//  buttonExtension.swift
//  SetGame
//
//  Created by Ashadur Omith on 9/30/20.
//  Copyright © 2020 Ashadur Omith. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func select(borderColor: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)) {
        self.layer.borderWidth = 5.0
        self.layer.borderColor = borderColor.cgColor
        self.layer.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    }
    
    func deselect() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        self.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    func IsSelected() -> Bool {
        return self.layer.borderWidth == 5.0
    }
}
