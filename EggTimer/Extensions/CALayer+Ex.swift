//
//  CALayer+Ex.swift
//  EggTimer
//
//  Created by roblack on 12/1/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import UIKit

extension CALayer {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float, maskToBounds: Bool = false) {
        masksToBounds = maskToBounds
        shadowOffset = offset
        shadowColor = color.cgColor
        shadowRadius = radius
        shadowOpacity = opacity
    }
    
    func addGradinet(startColor: UIColor, endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = frame.height / 2
        addSublayer(gradientLayer)
        gradientLayer.colors = [
            startColor.cgColor,
            endColor.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
    }
}
