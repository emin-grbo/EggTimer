//
//  UIColor+Ex.swift
//  EggTimer
//
//  Created by roblack on 11/30/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import UIKit

extension UIColor {
    class var primary:          UIColor { return UIColor(hex: "#3804B6FF")! }
    class var primaryDark:      UIColor { return UIColor(hex: "#2E05A0FF")! }
    class var textOnWhite:      UIColor { return UIColor(hex: "#2C3B51FF")! }
    class var stroke:           UIColor { return UIColor(hex: "#4109C7FF")! }
    class var lightShadow:      UIColor { return UIColor(hex: "#6C42E2FF")! }
    class var darkShadow:       UIColor { return UIColor(hex: "#2E04A2FF")! }
    class var background:       UIColor { return UIColor(hex: "#DCE8F5FF")! }
    class var darkWhiteShadow:  UIColor { return UIColor(hex: "#CBD8ECFF")! }
    class var lightWhiteShadow: UIColor { return UIColor(hex: "#EFF8FCFF")! }
    class var primaryWhite:     UIColor { return UIColor(hex: "#E1ECF7FF")! }
    class var eggOrange:        UIColor { return UIColor(hex: "#FF8412FF")! }
    class var eggOrangeLight:   UIColor { return UIColor(hex: "#FFA01FFF")! }
    class var eggOrangeDark:    UIColor { return UIColor(hex: "#D56D0AFF")! }
}

// MARK: Getting the colors from HEX value
extension UIColor {
    convenience init(rgbColorRed red: Double, green: Double, blue: Double, alpha: Double) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255,
                  alpha: CGFloat(alpha))
    }

    convenience init(_ red: Double, _ green: Double, _ blue: Double) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255,blue: CGFloat(blue)/255,
                  alpha: CGFloat(1.0))
    }

    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber  & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
