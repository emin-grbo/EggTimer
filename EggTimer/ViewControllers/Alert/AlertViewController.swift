//
//  AlertViewController.swift
//  EggTimer
//
//  Created by Emin Roblack on 13/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class AlertViewController: UIViewController {

    let alertViewModel: AlertModel
    weak var delegate: AlertVCDelegate?
    
    @IBOutlet weak var bgView: UIView! { didSet {
        bgView.backgroundColor = .background
        }}
    @IBOutlet weak var animationView: AnimationView!
    
    @IBOutlet weak var alertTitleLabel: UILabel! { didSet {
        alertTitleLabel.font = UIFont(name: "RobotoMono-Bold", size: 20)
        alertTitleLabel.textColor = .black
        }}
    @IBOutlet weak var alertSubtitleLabel: UILabel! { didSet {
        alertSubtitleLabel.font = UIFont(name: "RobotoMono-Bold", size: 14)
        alertSubtitleLabel.textColor = .lightGray
        }}
    @IBOutlet weak var cancelBtn: RBbutton! { didSet {
        cancelBtn.primary = .primaryWhite
        cancelBtn.primaryDark = .background
        cancelBtn.lightShadow = .lightWhiteShadow
        cancelBtn.darkShadow = .darkWhiteShadow
        cancelBtn.setTitleColor(.primary, for: .normal)
        cancelBtn.titleLabel?.font = UIFont(name: "RobotoMono-Bold", size: 16)
        cancelBtn.setTitle(alertViewModel.buttonString, for: .normal)
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupAnimation()
        cancelBtn.layoutSubviews()
        // Do any additional setup after loading the view.
    }

    // MARK: - Initializers
    init(alert: AlertModel) {
        self.alertViewModel = alert
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        bgView.layer.cornerRadius = 10
        cancelBtn.titleLabel?.textColor = .white
        cancelBtn.backgroundColor = UIColor(displayP3Red: 54/255, green: 9/255, blue: 178/255, alpha: 1)
        animationView.backgroundColor = .clear
        
        alertTitleLabel.text = alertViewModel.title
        alertSubtitleLabel.text = alertViewModel.subtitle
    }
    
    private func setupAnimation() {
        animationView.animation = Animation.named(alertViewModel.animation)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        bgView.layoutSubviews()
        
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
