//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-03-09.
//

import UIKit

public class GreenPrimaryStyle: BrandStyle {
    public var defaultColor: UIColor
    public var pressedColor: UIColor
    public var font: UIFont
    
    public init() {
        self.defaultColor = UIColor(rgb: (66, 133, 0))
        self.pressedColor = UIColor(rgb: (49, 99, 0))
        self.font = .systemFont(ofSize: 18, weight: .semibold)
    }
}
