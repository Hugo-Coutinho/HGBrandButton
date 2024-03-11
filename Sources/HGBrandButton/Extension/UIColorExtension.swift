//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2024-03-09.
//

import UIKit

public extension UIColor {
    static var disabledColor = UIColor(rgb: (155, 162, 166))
    
    convenience init(rgb: (Int, Int, Int), alpha: CGFloat = 1.0) {
        let red = CGFloat(rgb.0) / 255.0
        let green = CGFloat(rgb.1) / 255.0
        let blue = CGFloat(rgb.2) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
