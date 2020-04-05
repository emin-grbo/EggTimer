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
        
        In return, i will provide with a new app Icon 🤘
        """
        }}
    
    @IBOutlet weak var coffeeIconImage: UIImageView! { didSet {
        coffeeIconImage.image = UIImage(named: "coffeeIcon")?.noir()
        coffeeIconImage.alpha = 0.5
        coffeeIconImage.layer.cornerRadius = 5
        coffeeIconImage.clipsToBounds = true
        }}
    @IBOutlet weak var coffeeIcon: IconButton! { didSet {
        coffeeIcon.primary = .primaryWhite
        coffeeIcon.primaryDark = .primaryWhite
        coffeeIcon.lightShadow = .lightWhiteShadow
        coffeeIcon.darkShadow = .darkWhiteShadow
        coffeeIcon.layer.cornerRadius = 5
        coffeeIcon.setTitleColor(.primary, for: .normal)
        }}
    @IBOutlet weak var coffinatedLabel: UILabel! { didSet {
        coffinatedLabel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        coffinatedLabel.textColor = .primary
        coffinatedLabel.text = "coffienated appIcon"
        }
    }
    @IBOutlet weak var coffienatedStatus: UILabel! { didSet {
        coffienatedStatus.font = UIFont(name: "RobotoMono-Regular", size: 12)
        coffienatedStatus.textColor = .primary
        coffienatedStatus.text = "LOCKED"
        }
    }
    
    
    @IBOutlet weak var beerIconImage: UIImageView! { didSet {
        beerIconImage.image = UIImage(named: "beerIcon")?.noir()
        beerIconImage.alpha = 0.5
        beerIconImage.layer.cornerRadius = 5
        beerIconImage.clipsToBounds = true
        }}
    @IBOutlet weak var beerIcon: IconButton! { didSet {
        beerIcon.primary = .primaryWhite
        beerIcon.primaryDark = .primaryWhite
        beerIcon.lightShadow = .lightWhiteShadow
        beerIcon.darkShadow = .darkWhiteShadow
        beerIcon.layer.cornerRadius = 5
        beerIcon.setTitleColor(.primary, for: .normal)
        }}
    @IBOutlet weak var beernatedLAbel: UILabel! { didSet {
        beernatedLAbel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        beernatedLAbel.textColor = .primary
        beernatedLAbel.text = "beernated appIcon"
        }
    }
    @IBOutlet weak var beernatedStatus: UILabel! { didSet {
        beernatedStatus.font = UIFont(name: "RobotoMono-Regular", size: 12)
        beernatedStatus.textColor = .primary
        beernatedStatus.text = "LOCKED"
        }
    }
    
    
    
    
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
        coffeeIcon.layoutSubviews()
        beerIcon.layoutSubviews()
        
        coffinatedLabel.alpha = 1
        beernatedLAbel.alpha = 1
        coffienatedStatus.alpha = 0.3
        beernatedStatus.alpha = 0.3
        
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
                self.setupBoughtButtons()
            }
        }
    }
    }
    
    func enableButtons() {
        getCoffeeButton.isEnabled = true
        getCoffeeButton.alpha = 1
    }
    
    func setupBoughtButtons() {
        for product in products {
            if ShopProducts.store.isProductPurchased(product.productIdentifier) {
                if product.localizedTitle.contains("Coffee") {
                    coffienatedStatus.text = "✅ UNLOCKED! Thank you!"
                    coffeeIconImage.alpha = 1
                    coffienatedStatus.alpha = 1
                } else if product.localizedTitle.contains("Beer") {
                    beernatedStatus.text = "✅ UNLOCKED! Thank you!"
                    beerIconImage.alpha = 1
                    beernatedStatus.alpha = 1
                }
                
            }
        }
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
        coverView.addSubview(spinnerView)
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
