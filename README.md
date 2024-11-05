# EAN13kit
Copyright © 2024 Bastiaan Quast, ValiQ Security.

**EAN13kit** is an open-source Swift library for generating [EAN-13](https://en.wikipedia.org/wiki/International_Article_Number) barcode images. 
The EAN-13 barcode, originally known as the **European Article Number** and now referred to simply as **International Article Number**,
is a 13-digit barcode standard used worldwide, particularly outside North America, for identifying products in retail environments. 
EAN-13 is similar to the [UPC](https://en.wikipedia.org/wiki/Universal_Product_Code) (Universal Product Code) system, 
which is popular in the United States and implemented directly by Apple in iOS, but EAN-13 is not supported natively. 
This library fills that gap, providing a solution for generating EAN-13 barcodes in Swift.

EAN-13 barcodes are designed for global product identification, with an additional digit to extend UPC’s capabilities internationally. 
They incorporate a [Reed-Solomon](https://en.wikipedia.org/wiki/Reed%E2%80%93Solomon_error_correction) error correction algorithm, 
which helps maintain data integrity and ensures readability despite potential scanning issues. 
EAN-13 barcodes are widely used across Europe and many other regions, making them essential for products sold internationally.

## Features

- Generates EAN-13 compliant barcode images
- Easy-to-use API designed specifically for Swift projects
- Outputs barcodes as `UIImage`, ready for display in iOS applications

## Installation

To install **EAN13kit**, simply download or clone this repository and add `EAN13BarcodeGenerator.swift` to your Xcode project. 

1. Download `EAN13BarcodeGenerator.swift` and add it to your Xcode project.
2. Import UIKit where you intend to use **EAN13kit**.

## Usage

Here's how to create an EAN-13 barcode image with **EAN13kit**:

```swift
import UIKit
import EAN13kit

if let barcodeImage = drawEAN13Barcode(from: "1234567890128") {
    // Use barcodeImage as needed, e.g., display in a UIImageView
    imageView.image = barcodeImage
} else {
    print("Invalid EAN-13 code provided.")
}
```
### Validating Codes

**EAN13kit** automatically validates the code length. If an invalid EAN-13 code is provided, `drawEAN13Barcode` returns `nil`.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Contributing

Contributions are welcome! If you’d like to contribute to **EAN13kit**, please submit a pull request with a clear description of your changes. All contributions will be reviewed, and improvements to functionality or documentation are especially appreciated.

## About

**EAN13kit** was created to provide a simple, reliable way to generate EAN-13 barcodes in Swift. If you have any feedback, suggestions, or requests, please feel free to open an issue or reach out!

---

Happy coding with **EAN13kit**!
