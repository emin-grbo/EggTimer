//
//  RBbutton.swift
//  EggTimer
//
//  Created by Emin Grbo on 7/13/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import Foundation
import UIKit

class RBbutton: UIButton {
    
    let layer1 = CALayer()
    let layerDark = CALayer()
    let layerLight = CALayer()
    let innerShadow = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        
        layer.cornerRadius = 25

        // font setup
        titleLabel?.font = UIFont(name: "RobotoMono-Regular", size: 18)
//        tapUp()
        titleLabel?.textAlignment = .center
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
        
        
    }
    
//    override var isSelected: Bool {
//        willSet {
////            isSelected ? tapDown() : tapUp()
//            print("changing from \(isSelected) to \(newValue)")
//        }
//
//        didSet {
////            isSelected ? tapDown() : tapUp()
//            print("changed from \(oldValue) to \(isSelected)")
//        }
//    }
    
    func tapDown() {
        layerDark.opacity = 0.5
        layerLight.opacity = 0.5
        innerShadow.opacity = 1
        
        innerShadow.frame = bounds

        // Shadow path (1pt ring around bounds)
        let radius = CGFloat(30)
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy:-1), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()

        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        // Shadow properties
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 1, height: 1)
        innerShadow.shadowOpacity = 1
        innerShadow.shadowRadius = 5
        innerShadow.cornerRadius = self.frame.size.height/2
        layer.addSublayer(innerShadow)
    }
    
    func tapUp() {
        layerDark.opacity = 1
        layerLight.opacity = 1
        innerShadow.opacity = 0
        
        layer1.frame = layer.bounds
        layer1.cornerRadius = layer.cornerRadius
        layer1.masksToBounds = false
        layer1.backgroundColor = UIColor.primary.cgColor
        layer.insertSublayer(layer1, at: 0)
        
        layerDark.frame = layer.bounds
        layerDark.cornerRadius = layer.cornerRadius
        layerDark.masksToBounds = true
        layerDark.backgroundColor = UIColor.primary.cgColor
        layer.insertSublayer(layerDark, at: 0)
        layerDark.addShadow(offset: CGSize.init(width: 7, height: 7), color: .darkShadow, radius: 5, opacity: 1)
        
        layerLight.frame = layer.bounds
        layerLight.cornerRadius = layer.cornerRadius
        layerLight.masksToBounds = true
        layerLight.backgroundColor = UIColor.primary.cgColor
        layer.insertSublayer(layerLight, at: 0)
        layerLight.addShadow(offset: CGSize.init(width: -3, height: -3), color: .lightShadow, radius: 5, opacity: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        isSelected ? tapDown() : tapUp()
    }

    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        switch isSelected {
//        case true:
//            setTitle("cancel", for: .selected)
//            setTitleColor(.white, for: .selected)
//
//            layerDark.opacity = 0.5
//            layerLight.opacity = 0.5
//            innerShadow.opacity = 1
//
//            innerShadow.frame = bounds
//
//            // Shadow path (1pt ring around bounds)
//            let radius = CGFloat(30)
//            let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy:-1), cornerRadius:radius)
//            let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
//
//            path.append(cutout)
//            innerShadow.shadowPath = path.cgPath
//            innerShadow.masksToBounds = true
//            // Shadow properties
//            innerShadow.shadowColor = UIColor.black.cgColor
//            innerShadow.shadowOffset = CGSize(width: 1, height: 1)
//            innerShadow.shadowOpacity = 1
//            innerShadow.shadowRadius = 5
//            innerShadow.cornerRadius = self.frame.size.height/2
//            layer.addSublayer(innerShadow)
//
//        default:
//            setTitle("start", for: .normal)
//
//            layerDark.opacity = 1
//            layerLight.opacity = 1
//            innerShadow.opacity = 0
//
//            layer1.frame = layer.bounds
//            layer1.cornerRadius = layer.cornerRadius
//            layer1.masksToBounds = false
//            layer1.backgroundColor = UIColor.primary.cgColor
//            layer.insertSublayer(layer1, at: 0)
//
//            layerDark.frame = layer.bounds
//            layerDark.cornerRadius = layer.cornerRadius
//            layerDark.masksToBounds = true
//            layerDark.backgroundColor = UIColor.primary.cgColor
//            layer.insertSublayer(layerDark, at: 0)
//            layerDark.addShadow(offset: CGSize.init(width: 7, height: 7), color: .darkShadow, radius: 5, opacity: 1)
//
//            layerLight.frame = layer.bounds
//            layerLight.cornerRadius = layer.cornerRadius
//            layerLight.masksToBounds = true
//            layerLight.backgroundColor = UIColor.primary.cgColor
//            layer.insertSublayer(layerLight, at: 0)
//            layerLight.addShadow(offset: CGSize.init(width: -3, height: -3), color: .lightShadow, radius: 5, opacity: 1)
//        }
//
//    }
 
}

extension CALayer {
func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
    masksToBounds = false
    shadowOffset = offset
    shadowColor = color.cgColor
    shadowRadius = radius
    shadowOpacity = opacity
}
    
    public enum innerShadowSide
    {
        case all, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
    }
    
    // define function to add inner shadow
    public func addInnerShadow(onSide: innerShadowSide, shadowColor: UIColor, shadowSize: CGFloat, cornerRadius: CGFloat = 0.0, shadowOpacity: Float)
    {
        // define and set a shaow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowSize
        shadowLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        // define shadow path
        let shadowPath = CGMutablePath()
    
        let insetRect = bounds.insetBy(dx: -shadowSize * 2.0, dy: -shadowSize * 2.0)
        
//        let clipPath = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius).cgPath
//        inset.addPath(clipPath, transform: .identity)
        
        // define outer rectangle to restrict drawing area
        

        
        
        // define inner rectangle for mask
        let innerFrame: CGRect = { () -> CGRect in
            switch onSide
            {
                case .all:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
                case .left:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .right:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .top:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case.bottom:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndLeft:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndLeft:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .exceptLeft:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptRight:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptTop:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
                case .exceptBottom:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
            }
        }()

        // add outer and inner rectangle to shadow path
        shadowPath.addRect(insetRect)
        shadowPath.addRect(innerFrame)
        
        // set shadow path as show layer's
        shadowLayer.path = shadowPath
        
        // add shadow layer as a sublayer
        addSublayer(shadowLayer)
        
        // hide outside drawing area
        masksToBounds = true
    }
}
