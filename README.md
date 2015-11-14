# SUCheckButton

[![Version](https://img.shields.io/cocoapods/v/SUCheckButton.svg?style=flat)](http://cocoapods.org/pods/SUCheckButton)
[![License](https://img.shields.io/cocoapods/l/SUCheckButton.svg?style=flat)](http://cocoapods.org/pods/SUCheckButton)
[![Platform](https://img.shields.io/cocoapods/p/SUCheckButton.svg?style=flat)](http://cocoapods.org/pods/SUCheckButton)

Light-weight, no use image check button.

![screenshot1](screenshots/screenshot1.png)

## Features

- This class is subclass of `UIControl`.
- Equip `@IBInspectable`. You can change color, border in Storyboard.
- Equip `@IBDesignable`. You can see check button in storyboard
- Animate when button pressed.(scale animation)
- Immediately update when property changed.

## Requirements

- Xcode 7.0
- Swift 2.0 (2.1 is not fully compatible)

## Installation

SUCheckButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SUCheckButton"
```

and run

```bash
pod install
```

## Usage

### Use in Storyboard

- Add view in storyboard
- Change Class to `SUCheckButton`
- If you want to change color,border width,etc.. , open `Attribute Inspector` and change it.

### Use in code

```swift

import SUCheckButton

// Use convenience initializer
let checkButton = SUCheckButton() // make default frame: {0, 0, 30, 30}

// Use normal initializer
let checkButton = SUCheckButton(frame: CGRectMake(0, 0, 44, 44))

// change color
checkButton.checkedFillColor = UIColor(red: 1.0, green: 0.2, blue: 0.1, alpha: 1.0)

// did press handler
checkButton.didPressHandler = { (checked: Bool) in
    print("status : \(checked)")
}
// also use addTarget:action:forControlEvents:
checkButton.addTarget(self, action: "checkValueChanged:", forControlEvents: .ValueChanged)

```

If use just mark (not use as a buton), set `userInteractionEnabled = false`

```swift
checkButton.userInteractionEnabled = false

checkButton.checked = true // status : checked. change mark.
checkButton.checked = false // status : unchecked. change mark.
```


## License

MIT license. See the LICENSE file for more info.
