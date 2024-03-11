//
//  File.swift
//  
//
//  Created by Hugo Coutinho on 2024-03-11.
//

import UIKit
import HGBrandButton

public class DemoViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var primaryDefaultButton: BrandButton = {
        let button = BrandButton(style: .primary(GreenPrimaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Primary default"
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var primaryBlueButton: BrandButton = {
        let button = BrandButton(style: .primary(BluePrimaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Primary default"
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var primaryDisabledButton: BrandButton = {
        let button = BrandButton(style: .primary(BluePrimaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Primary default"
        button.isEnabled = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var primaryLeadingIconButton: BrandButton = {
        let button = BrandButton(style: .primary(GreenPrimaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Primary default"
        button.leadingIcon = UIImage(systemName: "apple.logo")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var primaryTrailingIconButton: BrandButton = {
        let button = BrandButton(style: .primary(BluePrimaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Primary default"
        button.trailingIcon = UIImage(systemName: "apple.logo")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondaryButton: BrandButton = {
        let button = BrandButton(style: .secondary(GreenSecondaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Secondary default"
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondaryLeadingIconButton: BrandButton = {
        let button = BrandButton(style: .secondary(BlueSecondaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Secondary default"
        button.leadingIcon = UIImage(systemName: "apple.logo")?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondaryTrailingIconButton: BrandButton = {
        let button = BrandButton(style: .secondary(GreenSecondaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Secondary default"
        button.trailingIcon = UIImage(systemName: "apple.logo")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondaryDisabledButton: BrandButton = {
        let button = BrandButton(style: .secondary(GreenSecondaryStyle()))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.label = "Secondary default"
        button.isEnabled = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        title = "Demo"
        view.backgroundColor = .systemBackground
        setup()
    }
    
    @objc func buttonTapped() {
           print("Button tapped!")
       }
}

extension DemoViewController {
    private func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(primaryDefaultButton)
        stackView.addArrangedSubview(primaryBlueButton)
        stackView.addArrangedSubview(primaryDisabledButton)
        stackView.addArrangedSubview(primaryLeadingIconButton)
        stackView.addArrangedSubview(primaryTrailingIconButton)
        stackView.addArrangedSubview(secondaryButton)
        stackView.addArrangedSubview(secondaryLeadingIconButton)
        stackView.addArrangedSubview(secondaryTrailingIconButton)
        stackView.addArrangedSubview(secondaryDisabledButton)
        setupConstraints()
    }
}

extension DemoViewController {
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupStackViewConstraints()
        setupButtonConstraints()
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }

    private func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupButtonConstraints() {
        NSLayoutConstraint.activate([
            primaryDefaultButton.heightAnchor.constraint(equalToConstant: 50),
            primaryLeadingIconButton.heightAnchor.constraint(equalToConstant: 50),
            primaryTrailingIconButton.heightAnchor.constraint(equalToConstant: 50),
            primaryBlueButton.heightAnchor.constraint(equalToConstant: 50),
            primaryDisabledButton.heightAnchor.constraint(equalToConstant: 50),
            secondaryButton.heightAnchor.constraint(equalToConstant: 50),
            secondaryLeadingIconButton.heightAnchor.constraint(equalToConstant: 50),
            secondaryTrailingIconButton.heightAnchor.constraint(equalToConstant: 50),
            secondaryDisabledButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
