//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-03-09.
//

import UIKit

public enum ButtonStyle {
    case primary(BrandStyle)
    case secondary(BrandStyle)
    
    public var backgroundColor: UIColor {
        switch self {
        case .primary(let brand):
            return brand.defaultColor
        case .secondary:
            return .clear
        }
    }
    
    public var textColor: UIColor {
        switch self {
        case .primary:
            return .white
        case .secondary(let brand):
            return brand.defaultColor
        }
    }
    
    public var borderColor: CGColor {
        switch self {
        case .primary(let brand), .secondary(let brand):
            return brand.defaultColor.cgColor
        }
    }
    
    public var pressedColor: UIColor {
        switch self {
        case .primary(let brand), .secondary(let brand):
            return brand.pressedColor
        }
    }
    
    public var textPressedColor: UIColor {
        switch self {
        case .primary:
            return .white
        case .secondary(let brand):
            return brand.defaultColor
        }
    }
    
    public var disabledBackgroundColor: UIColor {
        switch self {
        case .primary(_):
            return .disabledColor
            
        case .secondary:
            return .white
        }
    }
    
    public var disabledTextColor: UIColor {
        switch self {
        case .primary:
            return .white
        case .secondary(_):
            return .disabledColor
        }
    }
    
    public var disabledBorderColor: CGColor {
        return UIColor.disabledColor.cgColor
    }
    
    public var hasBorder: Bool {
        switch self {
        case .primary:
            return false
            
        case .secondary:
            return true
        }
    }
    
    public var font: UIFont {
        switch self {
        case .primary(let brand), .secondary(let brand):
            return brand.font
        }
    }
}
