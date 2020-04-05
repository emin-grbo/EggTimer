//
//  IconImage.swift
//  EggTimer
//
//  Created by Emin Roblack on 05/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit

class IconButton: UIButton {
    
    let layerBase       = CALayer()
    let layerDark       = CALayer()
    let layerLight      = CALayer()
    let innerShadow     = CALayer()
    
    var lightShadow     : UIColor = .lightShadow
    var darkShadow      : UIColor = .darkShadow
    var primary         : UIColor = .primary
    var primaryDark     : UIColor = .primaryDark
    var radius          : CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = 5
        titleLabel?.font = UIFont(name: "RobotoMono-Regular", size: 18)
        titleLabel?.textAlignment = .center
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
    }
    
    func tapDown() {
        layerDark.opacity = 0.5
        layerLight.opacity = 0.5
        innerShadow.opacity = 1
    }
    
    func tapUp() {
        layerDark.opacity = 1
        layerLight.opacity = 1
        innerShadow.opacity = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadows()
        isSelected ? tapDown() : tapUp()
    }
    
    func addShadows() {
        
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -2, dy:-2), cornerRadius: radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius: radius).reversing()
        
        for lay in [layerLight, layerDark, layerBase, innerShadow] {
            lay.shouldRasterize = true
            lay.rasterizationScale = UIScreen.main.scale
            lay.frame = bounds
            lay.shadowPath = path.cgPath
            lay.masksToBounds = true
            lay.cornerRadius = 5
            layer.addSublayer(lay)
        }

        layerBase.addIconGradinet(startColor: primaryDark, endColor: primary, radius: 5)
        
        layerLight.addShadow(offset: CGSize.init(width: -3, height: -3), color: lightShadow, radius: radius, opacity: 0.7)
        layerDark.addShadow(offset: CGSize.init(width: 5, height: 5), color: darkShadow, radius: radius, opacity: 1)

        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.addShadow(offset: CGSize(width: 0, height: 2), color: .black, radius: radius, opacity: 0.5, maskToBounds: true)

        self.bringSubviewToFront(titleLabel!)
    }

}
