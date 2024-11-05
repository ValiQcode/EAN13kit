//
//  EAN13BarcodeGenerator.swift
//  Bastiaan Quast
//  ValiQ Security
//
import UIKit

// Define the digit patterns for EAN-13 using enums
enum EAN13Pattern: String {
    case leftOdd = "odd", leftEven = "even"
    
    var patterns: [String] {
        switch self {
        case .leftOdd:
            return ["0001101", "0011001", "0010011", "0111101", "0100011", "0110001",
                    "0101111", "0111011", "0110111", "0001011"]
        case .leftEven:
            return ["0100111", "0110011", "0011011", "0100001", "0011101", "0111001",
                    "0000101", "0010001", "0001001", "0010111"]
        }
    }
}

let rightPatterns = [
    "1110010", "1100110", "1101100", "1000010", "1011100", "1001110",
    "1010000", "1000100", "1001000", "1110100"
]

// Function to create an EAN-13 barcode image
func drawEAN13Barcode(from code: String) -> UIImage? {
    guard code.count == 13, code.allSatisfy({ $0.isNumber }) else { return nil }
    
    // Convert the code string to an array of Ints
    let digits = code.compactMap { Int(String($0)) }
    let encodingPattern = [
        [EAN13Pattern.leftOdd, EAN13Pattern.leftOdd, EAN13Pattern.leftOdd, EAN13Pattern.leftOdd, EAN13Pattern.leftOdd, EAN13Pattern.leftOdd],
        [EAN13Pattern.leftOdd, EAN13Pattern.leftOdd, EAN13Pattern.leftEven, EAN13Pattern.leftOdd, EAN13Pattern.leftEven, EAN13Pattern.leftEven],
        ...
    ][digits.first!]

    // Start barcode string with start pattern
    var barcodePattern = "101"
    
    // Encode the left side digits
    for i in 0..<6 {
        let digit = digits[i + 1]
        let pattern = encodingPattern[i].patterns[digit]
        barcodePattern += pattern
    }
    
    // Middle pattern
    barcodePattern += "01010"
    
    // Encode the right side digits
    for i in 7..<13 {
        let digit = digits[i]
        barcodePattern += rightPatterns[digit]
    }
    
    // End pattern
    barcodePattern += "101"
    
    // Create the barcode image
    return generateBarcodeImage(from: barcodePattern)
}

// Helper function to generate barcode image from pattern
private func generateBarcodeImage(from pattern: String) -> UIImage? {
    let scale = UIScreen.main.scale
    let width = pattern.count * 2 // Each bar is 2 pixels wide
    let height = 100
    UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, scale)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    
    context.setFillColor(UIColor.black.cgColor)
    for (index, char) in pattern.enumerated() where char == "1" {
        context.fill(CGRect(x: index * 2, y: 0, width: 2, height: height))
    }
    
    let barcodeImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return barcodeImage
}
