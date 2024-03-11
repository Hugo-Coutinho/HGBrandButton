//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2024-03-10.
//

import UIKit

public class GreenSecondaryStyle: BrandStyle {
    public var defaultColor: UIColor
    public var pressedColor: UIColor
    public var font: UIFont
    
    public init() {
        self.defaultColor = UIColor(rgb: (66, 133, 0))
        self.pressedColor = UIColor(rgb: (236, 243, 230))
        self.font = .systemFont(ofSize: 18, weight: .semibold)
    }
}
