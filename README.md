## BrandButton

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/README-Assets/blob/master/Other/brandButtonExample.gif?raw=true" width="250" height="450"/>
                </a>
            </td>            
        </tr>   
    </table>
</div>

## Usage

To use BrandButton in your iOS project, follow these steps:

1. Add the HGBrandButton package to your project dependencies. You can do this by adding the following line to your Package.swift file:

```swift
.package(url: "https://github.com/Hugo-Coutinho/HGBrandButton.git", from: "1.0.0")
```

2. In your target's dependencies, add HGBrandButton as a dependency:

```swift
.product(name: "HGBrandButton", package: "HGBrandButton")
```

3. Import the module in your Swift files where you want to use BrandButton:

```swift
import HGBrandButton
```

4. Now, you can create instances of BrandButton and customize them according to your needs. For example:

```swift
let button = BrandButton(style: .primary(GreenPrimaryStyle()))
button.label = "Press Me"
button.size = .medium
button.leadingIcon = UIImage(named: "leadingIcon")
button.trailingIcon = UIImage(named: "trailingIcon")
```

5. To use SwiftUIBrandButton in SwiftUI:

```swift
SwiftUIBrandButton(
    style: .primary(BluePrimaryStyle()),
    label: "Press me",
    size: .full,
    leadingIcon: UIImage(systemName: "apple.logo")?.withTintColor(.white, renderingMode: .alwaysOriginal)
) {
    print("Button tapped!")
}
```


## Customization

You can create your own custom styles for BrandButton by conforming to the BrandStyle protocol and implementing the required properties. Here's how you can create a custom style similar to GreenPrimaryStyle:

1. Create a new Swift file in your project and define your custom style class. For example, let's call it CustomBrandStyle:

```swift
import UIKit
import HGBrandButton

public class CustomBrandStyle: BrandStyle {
    public var defaultColor: UIColor
    public var pressedColor: UIColor
    public var font: UIFont
    
    public init() {
        // Customize these properties according to your design
        self.defaultColor = UIColor.blue // Change to your desired default color
        self.pressedColor = UIColor.darkBlue // Change to your desired pressed color
        self.font = .systemFont(ofSize: 18, weight: .semibold) // Change to your desired font
    }
}
```

2. In the init() method of CustomBrandStyle, set the defaultColor, pressedColor, and font properties to your desired values.

3. Now you can use CustomBrandStyle when creating instances of BrandButton:

```swift
let customStyle = CustomBrandStyle()
let customButton = BrandButton(style: .primary(customStyle))
customButton.label = "Custom Button"
customButton.size = .regular
customButton.leadingIcon = UIImage(named: "customLeadingIcon")
customButton.trailingIcon = UIImage(named: "customTrailingIcon")
```

4. Customize the properties of CustomBrandStyle as needed to achieve the desired appearance for your buttons.
