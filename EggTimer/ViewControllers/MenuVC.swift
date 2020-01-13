//
//  MenuVC.swift
//  EggTimer
//
//  Created by roblack on 1/13/20.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class MenuVC: UIViewController {
    
    
    @IBOutlet weak var getCoffeeButton: RBbutton! { didSet {
           getCoffeeButton.setTitle("☕️ coffee's on me! 1$", for: .normal)
           getCoffeeButton.primary = .primaryWhite
           getCoffeeButton.primaryDark = .primaryWhite
           getCoffeeButton.lightShadow = .lightWhiteShadow
           getCoffeeButton.darkShadow = .darkWhiteShadow
           getCoffeeButton.setTitleColor(.primary, for: .normal)
           }}
    
    @IBOutlet weak var getBeerButton: RBbutton! { didSet {
           getBeerButton.setTitle("🍺 one beer on me! 5$", for: .normal)
           getBeerButton.primary = .primaryWhite
           getBeerButton.primaryDark = .primaryWhite
           getBeerButton.lightShadow = .lightWhiteShadow
           getBeerButton.darkShadow = .darkWhiteShadow
           getBeerButton.setTitleColor(.primary, for: .normal)
           }}
    
    @IBOutlet weak var animationButtonView: AnimationView!
    @IBOutlet weak var infoLabel: UILabel! { didSet {
        infoLabel.textColor = .textOnWhite
        infoLabel.text =
        """
        Hi! I am Emin and thank you SO MUCH for downloading my first app! 🥇
        You rock! 🤘
        
        It is kinda simple, but hopefully a feast for your eyeballs.
        🍖 👀
        
        Including ads would be quite a douche move for such a small app, but if you appreciate what i did here, you can get me a beer or a coffee below.
        
        I will love you either way
        because you know . . . you rock! 🤘
        """
        }}
    
    weak var delegate                   : InfoVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        addMenuAnimation()
        self.view.backgroundColor = .background
        getBeerButton.layoutSubviews()
        getCoffeeButton.layoutSubviews()
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        delegate?.animate(menuClosed: true)
        self.dismiss(animated: true)
    }
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menuBlack")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(toProgress: 0.5)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
