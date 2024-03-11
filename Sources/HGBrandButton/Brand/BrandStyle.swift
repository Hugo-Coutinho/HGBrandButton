//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-03-09.
//

import UIKit

public protocol BrandStyle {
    var defaultColor: UIColor { get }
    var pressedColor: UIColor { get }
    var font: UIFont { get }
}
