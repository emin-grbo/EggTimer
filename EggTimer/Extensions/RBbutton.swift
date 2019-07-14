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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        titleLabel?.textAlignment = .center
        layer.cornerRadius = 25
        backgroundColor = UIColor.white
        
        //startButton.layer.shadowPath = UIBezierPath(rect: startButton.bounds).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 0.2
        
        // font setup
        titleLabel?.font = UIFont(name: "RobotoMono-Bold", size: 24)
    }
    
    
    
    
}
