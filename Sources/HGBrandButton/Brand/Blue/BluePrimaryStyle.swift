//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2024-03-09.
//

import UIKit

public class BluePrimaryStyle: BrandStyle {
    public var pressedColor: UIColor
    public var defaultColor: UIColor
    public var font: UIFont
    
    public init() {
        self.pressedColor = UIColor(rgb: (0, 95, 129))
        self.defaultColor = UIColor(rgb: (0, 127, 173))
        self.font = .systemFont(ofSize: 18, weight: .semibold)
    }
}
