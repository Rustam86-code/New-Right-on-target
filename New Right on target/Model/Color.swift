//
//  Color.swift
//  New Right on target
//
//  Created by Rustam Tleubayev on 17.03.2022.
//

import Foundation
import UIKit

enum ButtonAppearance {
    
    static let firstTeplate = UIColor.red
    static let secondTemplate = UIColor.green
    static let thirdTemplate = UIColor.blue
    static let fourthTemlate = UIColor.black
}

var arrayColors = [ButtonAppearance.self]

protocol ColorProtocol {
    
    var red: UInt8 {get}
    var green: UInt8  {get}
    var blue: UInt8 {get}
    
    init (from: UIColor)
    
    func getByHexString () -> String
    func getByUIColor() -> UIColor
}

struct Color: ColorProtocol, Equatable {
    
    var red: UInt8
    var green: UInt8
    var blue: UInt8
    
    init() {
        red = 0
        green = 0
        blue = 0
    }
    
    init (from color:UIColor) {
        red = UInt8(CGFloat(255)*color.cgColor.components![0])
        green = UInt8(CGFloat(255)*color.cgColor.components![1])
        blue = UInt8(CGFloat(255)*color.cgColor.components![2])
    }
    
    func getByHexString() -> String {
        var redPart = String(red, radix: 16, uppercase: true)
        if red <= 16 {
            redPart = "0\(redPart)"
        }
        var greenPart = String(green, radix: 16, uppercase: true)
        if green <= 16 {
            greenPart = "0\(greenPart)"
        }
        var bluePart = String(blue, radix: 16, uppercase: true)
        if  blue <= 16 {
            bluePart = "0\(bluePart)"
        }
        return "\(redPart)\(greenPart)\(bluePart)"
    }
    
    func getByUIColor() -> UIColor {
        
        let redFloat: Float = Float(red)/255
        let greenFloat: Float = Float(green)/255
        let bleuFloat: Float = Float(blue)/255
        
        return UIColor(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(bleuFloat), alpha: 1)
    }
    
    static func == (lhs: Color, rhs: Color) -> Bool {
        
        return lhs.red == rhs.red &&
        lhs.green == rhs.green &&
        lhs.blue == rhs.blue
    }
}

