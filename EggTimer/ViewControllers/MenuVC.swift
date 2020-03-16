//
//  MenuVC.swift
//  EggTimer
//
//  Created by roblack on 1/13/20.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie
import StoreKit

class MenuVC: UIViewController {
    
    var products: [SKProduct] = []
    
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
        Hi! I am Emin and thank you SO MUCH for downloading my first app!
        You rock! 🤘
        
        If you want to send me some ♥️,
        do so below ⬇️
        
        I will love you either way
        because you know . . . you rock! 🤘
        """
        }}
    
    weak var delegate                   : InfoVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupIAP()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupViews() {
        addMenuAnimation()
        self.view.backgroundColor = .background
        getBeerButton.layoutSubviews()
        getCoffeeButton.layoutSubviews()
        
        if view.frame.width > 320 {
            infoLabel.font = UIFont(name: "RobotoMono-Regular", size: 16)
        } else {
            infoLabel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        }
        
        // Disabling buttons
        getCoffeeButton.isEnabled = false
        getCoffeeButton.alpha = 0.5
        getBeerButton.isEnabled = false
        getBeerButton.alpha = 0.5
        
    }
    
    func setupIAP() {
        ShopProducts.store.requestProducts { [weak self] success, products in
        guard let self = self else { return }
        if success {
            // manage button separately
            self.products = products!
            DispatchQueue.main.async {
                self.enableButtons()
            }
        }
    }
    }
    
    func enableButtons() {
        getCoffeeButton.isEnabled = true
        getCoffeeButton.alpha = 1
    }
    
    func purchaseInitiated() {
        let coverView = UIView(frame: view.frame)
        let spinnerView = UIActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        spinnerView.style = UIActivityIndicatorView.Style.whiteLarge
        spinnerView.center = view.center
        spinnerView.startAnimating()
        coverView.backgroundColor = .black
        coverView.alpha = 0.5
        
        view.addSubview(coverView)
        view.addSubview(spinnerView)
    }
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menuBlack")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(toProgress: 0.5)
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        delegate?.animate(menuClosed: true)
        self.dismiss(animated: true)
    }
    
    @IBAction func buyCoffeeTaped(_ sender: Any) {
        purchaseInitiated()
        ShopProducts.store.buyProduct(products.first!)
    }
    
    @IBAction func buyBeerTapped(_ sender: Any) {
    }
    


}
