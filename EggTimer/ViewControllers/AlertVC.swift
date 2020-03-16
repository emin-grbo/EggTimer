//
//  AlertVC.swift
//  EggTimer
//
//  Created by Emin Grbo on 7/13/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class AlertVC: UIViewController {

    @IBOutlet var alertView: UIView!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var animationView: AnimationView!
    
    @IBOutlet weak var alertTitleLabel: UILabel! { didSet {
        alertTitleLabel.textColor = .black
        }}
    
    weak var delegate: AlertVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupAnimation()
    }
    
    private func setupViews() {
        alertView.layer.cornerRadius = 10
        cancelBtn.titleLabel?.textColor = .white
        cancelBtn.backgroundColor = UIColor(displayP3Red: 54/255, green: 9/255, blue: 178/255, alpha: 1)
        animationView.backgroundColor = .clear
    }
    
    private func setupAnimation() {
        animationView.animation = Animation.named("bear")
        
        animationView.contentMode = .scaleAspectFill

        animationView.loopMode = .loop
        animationView.play()
        alertView.layoutSubviews()
        
        // Adding some blur
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
        //-----------------------------------------------------------------------------------------
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        delegate?.reset()
        self.dismiss(animated: true)
    }
    

}
