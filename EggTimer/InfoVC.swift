//
//  InfoVC.swift
//  EggTimer
//
//  Created by Emin Grbo on 7/13/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class InfoVC: UIViewController {


    @IBOutlet var animationButtonView: AnimationView!
    weak var delegate: InfoVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addMenuAnimation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default // .default
    }
    
    private func setupViews() {
        // Adding some blur
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
        //-----------------------------------------------------------------------------------------
    }
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menuBlack")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
//        animationButtonView.play()
        animationButtonView.play(toProgress: 0.5)
    }
    

    @IBAction func closeTapped(_ sender: Any) {
        animationButtonView.play(toProgress: 1)
        delegate?.animate()
        self.dismiss(animated: true)
    }
    

}
