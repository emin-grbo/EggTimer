//
//  attributionTVC.swift
//  EggTimer
//
//  Created by Emin Roblack on 12/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class attributionTVC: UITableViewCell {

    var attributer: Attributer! { didSet {
        setupViews()
        }}
    
    @IBOutlet weak var animationView: AnimationView! { didSet {
        animationView.backgroundColor = .clear
        animationView.loopMode = .loop
        }}
    
    
    @IBOutlet weak var iconImageBtn: IconButton! { didSet {
        iconImageBtn.primary = .primaryWhite
        iconImageBtn.primaryDark = .background
        iconImageBtn.lightShadow = .lightWhiteShadow
        iconImageBtn.darkShadow = .darkWhiteShadow
        iconImageBtn.isUserInteractionEnabled = false
        }}
    
    @IBOutlet weak var attributerTitle: UILabel! { didSet {
        attributerTitle.font = UIFont(name: "RobotoMono-Bold", size: 14)
        attributerTitle.textColor = .primary
        attributerTitle.text = "Emin Grbo"
        }}
    @IBOutlet weak var attributerSubtitle: UILabel! { didSet {
        attributerSubtitle.font = UIFont(name: "RobotoMono-Regular", size: 10)
        attributerSubtitle.textColor = .textOnBlue
        attributerSubtitle.text = "View Profile"
        }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .background
        
        
        // Initialization code
    }
    
    func setupViews() {
        attributerTitle.text = attributer.name
        attributerSubtitle.text = attributer.asset
        animationView.animation = Animation.named(attributer.animationString)
        animationView.play()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
