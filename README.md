# SafeNumbers Swift Macro

SafeNumbers is a Swift macro that aims to provide compile-time constraints to numeric types.

As of now it can enforce Positive and Negative (through their respective macros).

## Features
- Compile-time checks for positivity and negativity
- Supports both `Int` and `Double` literals
- Helps improve code safety and readability

## Requirements
- Swift 5.9+

## Installation

### Swift Package Manager

You can install SafeNumbers using the Swift Package Manager. To add SafeNumbers to your Xcode project, select `File` > `Add Package Dependencies`, and enter the following URL:

```swift
https://github.com/lucaswkuipers/SafeNumbers.git
```

You can then select to add the SafeNumbers Library to your desired target. Don't add the client executable.

## Usage
Import the SafeNumbers module in your Swift file.

```swift
import SafeNumbers
```

Use `#Positive` for creating positive numbers. Compiler will ensure the value you provide here is a positive number.

```swift
let positiveInteger = #Positive(42)
let positiveDouble = #Positive(123.456)
```

Similarly, use `#Negative` for negative numbers.

```swift
let negativeInteger = #Negative(-42)
let negativeDouble = #Negative(-123.456)
```

Note that trying to pass non-positive values to `#Positive` or non-negative values to `#Negative` will result in a compile-time error.

## Documentation

For more detailed documentation, refer to the source code which contains extensive DocC comments and usage guidelines.

## Support
If you find a bug or would like to request a new feature, please open a new issue.

## Contributions

Contributions to SafeNumbers are more than welcome! If you're interested in contributing, please fork the repository and make your changes in a separate branch. Once you're done, open a pull request.

## License
SafeNumbers is available under the MIT license. Check out the [LICENSE](./LICENSE) for more info.
