import UIKit

public class BrandButton: UIControl {
    
    // MARK: - UI ELEMENTS -
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var leadingImageView: UIImageView = {
        let leadingImageView = UIImageView()
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        leadingImageView.contentMode = .scaleAspectFit
        return leadingImageView
    }()
    
    private lazy var trailingImageView: UIImageView = {
        let trailingImageView = UIImageView()
        trailingImageView.translatesAutoresizingMaskIntoConstraints = false
        trailingImageView.contentMode = .scaleAspectFit
        return trailingImageView
    }()
    
    // MARK: - PROPERTIES -
    public var style: ButtonStyle {
        didSet {
            updateStyle()
        }
    }
    
    public var label: String? {
        didSet {
            titleLabel.text = label
        }
    }
    
    public var size: ButtonSize = .regular {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var leadingIcon: UIImage? {
        didSet {
            if let leadingIcon {
                setupLeadingIcon(icon: leadingIcon)
            }
        }
    }
    
    public var trailingIcon: UIImage? {
        didSet {
            if let trailingIcon {
                setupTrailingIcon(icon: trailingIcon)
            }
        }
    }
    
    // MARK: - CONSTRUCTOR -
    public init(style: ButtonStyle) {
        self.style = style
        super.init(frame: .zero)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        self.style = .primary(GreenPrimaryStyle())
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - ENUM -
    public enum ButtonSize {
        case regular
        case medium
        case full
    }
}

// MARK: - OVERRIDE -
extension BrandButton {
    public override var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        applyStyle(
            styleColor: style.pressedColor,
            textColor: style.textPressedColor, 
            font: style.font,
            borderColor: style.borderColor
        )
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        updateStyle()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateStyle()
        setupStackViewConstraints()
        setupWidthConstraint()
    }
}

// MARK: - SETUP -
extension BrandButton {
    private func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupLeadingIcon(icon: UIImage) {
        leadingImageView.image = leadingIcon
        stackView.insertArrangedSubview(leadingImageView, at: 0)
        setupLeadingIconContraints()
    }
    
    private func setupTrailingIcon(icon: UIImage) {
        trailingImageView.image = trailingIcon
        stackView.addArrangedSubview(trailingImageView)
        setupTrailingIconContraints()
    }
}

// MARK: - ASSISTANT -
extension BrandButton {
    private func calculateWidth() -> CGFloat {
        switch size {
        case .regular:
            return 220
        case .medium:
            return 150
        case .full:
            return UIScreen.main.bounds.width * 0.95
        }
    }
    
    private func updateStyle() {
        if isEnabled {
            applyStyle(
                styleColor: style.backgroundColor,
                textColor: style.textColor,
                font: style.font,
                borderColor: style.borderColor
            )
        } else {
            applyStyle(
                styleColor: style.disabledBackgroundColor,
                textColor: style.disabledTextColor,
                font: style.font,
                borderColor: style.disabledBorderColor
            )
        }
    }
    
    private func applyStyle(
        styleColor: UIColor,
        textColor: UIColor,
        font: UIFont,
        borderColor: CGColor
    ) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.backgroundColor = styleColor
            self.titleLabel.textColor = textColor
            self.titleLabel.font = font
            self.layer.borderColor = borderColor
            self.layer.borderWidth = self.style.hasBorder ? 1.2 : 0
            self.layer.cornerRadius = 8
        }, completion: nil)
    }
}

// MARK: - CONSTRAINTS -
extension BrandButton {
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupWidthConstraint() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: calculateWidth())
        ])
    }
    
    private func setupLeadingIconContraints() {
        NSLayoutConstraint.activate([
            leadingImageView.widthAnchor.constraint(equalToConstant: 24),
            leadingImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupTrailingIconContraints() {
        NSLayoutConstraint.activate([
            trailingImageView.widthAnchor.constraint(equalToConstant: 24),
            trailingImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
