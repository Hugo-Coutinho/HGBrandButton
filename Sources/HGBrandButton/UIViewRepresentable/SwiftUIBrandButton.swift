//
//  File.swift
//
//
//  Created by Hugo Coutinho on 2024-03-10.
//

import SwiftUI

public struct SwiftUIBrandButton: UIViewRepresentable {
    public var style: ButtonStyle
    public var label: String?
    public var size: BrandButton.ButtonSize
    public var leadingIcon: UIImage?
    public var trailingIcon: UIImage?
    public var action: () -> Void
    
    public init(style: ButtonStyle, label: String? = nil, size: BrandButton.ButtonSize, leadingIcon: UIImage? = nil, trailingIcon: UIImage? = nil, action: @escaping () -> Void) {
        self.style = style
        self.label = label
        self.size = size
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.action = action
    }
    
    public func makeUIView(context: Context) -> BrandButton {
        let button = BrandButton(style: style)
        button.label = label
        button.size = size
        button.leadingIcon = leadingIcon
        button.trailingIcon = trailingIcon
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }
    
    public func updateUIView(_ uiView: BrandButton, context: Context) {
        uiView.label = label
        uiView.size = size
        uiView.leadingIcon = leadingIcon
        uiView.trailingIcon = trailingIcon
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(action: action)
    }
    
    public class Coordinator: NSObject {
        public var action: () -> Void
        
        public init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc public func buttonTapped() {
            action()
        }
    }
}

