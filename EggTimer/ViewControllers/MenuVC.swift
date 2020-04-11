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
    var coverView = UIView(frame: .zero)
    weak var delegate : InfoVCDelegate?
    
    @IBOutlet weak var bgImgView: UIImageView! { didSet {
        bgImgView.image = UIImage(named: "menuBg")
        bgImgView.clipsToBounds = false
        }}
    
    @IBOutlet weak var textFrameImgView: UIImageView! { didSet {
        textFrameImgView.clipsToBounds = false
        textFrameImgView.addShadow(offset: .zero, color: .primaryDark, radius: 15, opacity: 1)
        }}
    
    @IBOutlet weak var getCoffeeButton: RBbutton! { didSet {
           getCoffeeButton.setTitle("☕️ coffee's on me! 1$", for: .normal)
           getCoffeeButton.primary = .primary
           getCoffeeButton.primaryDark = .primary
           getCoffeeButton.lightShadow = .lightShadow
           getCoffeeButton.darkShadow = .darkShadow
           getCoffeeButton.setTitleColor(.white, for: .normal)
           }}
    
    @IBOutlet weak var getBeerButton: RBbutton! { didSet {
           getBeerButton.setTitle("🍺 one beer on me! 5$", for: .normal)
           getBeerButton.primary = .primary
           getBeerButton.primaryDark = .primary
           getBeerButton.lightShadow = .lightShadow
           getBeerButton.darkShadow = .darkShadow
           getBeerButton.setTitleColor(.white, for: .normal)
           }}
    
    @IBOutlet weak var animationButtonView: AnimationView!
    @IBOutlet weak var infoLabel: UILabel! { didSet {
        infoLabel.textColor = .white
        infoLabel.font = UIFont(name: "RobotoMono-Bold", size: 14)
        infoLabel.text =
        """
        Hi! Thank you SO MUCH for downloading the app!

        You rock! 🤘
                
        If you want to send me some ♥️, do so below. In return, i will provide you with a new app Icon!
        """
        }}
    
    @IBOutlet weak var defaultIconImage: UIImageView! { didSet {
        defaultIconImage.image = UIImage(named: "defaultIcon")
        defaultIconImage.alpha = 1
        defaultIconImage.layer.cornerRadius = 5
        defaultIconImage.clipsToBounds = true
        }}
    @IBOutlet weak var defaultIcon: IconButton! { didSet {
        defaultIcon.primary = .primary
        defaultIcon.primaryDark = .primary
        defaultIcon.lightShadow = .lightShadow
        defaultIcon.darkShadow = .darkShadow
        defaultIcon.layer.cornerRadius = 5
        defaultIcon.setTitleColor(.white, for: .normal)
        }}
    @IBOutlet weak var defaultiatedLabel: UILabel! { didSet {
        defaultiatedLabel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        defaultiatedLabel.textColor = .white
        defaultiatedLabel.text = "defaultieted"
        }
    }
    @IBOutlet weak var defaultiatedLabelStatus: UILabel! { didSet {
        defaultiatedLabelStatus.font = UIFont(name: "RobotoMono-Regular", size: 12)
        defaultiatedLabelStatus.textColor = .white
        defaultiatedLabelStatus.text = "✅ UNLOCKED!"
        }
    }
    
    
    
    
    @IBOutlet weak var coffeeIconImage: UIImageView! { didSet {
        coffeeIconImage.image = UIImage(named: "coffeeIcon")?.noir()
        coffeeIconImage.alpha = 0.3
        coffeeIconImage.layer.cornerRadius = 5
        coffeeIconImage.clipsToBounds = true
        }}
    @IBOutlet weak var coffeeIcon: IconButton! { didSet {
        coffeeIcon.primary = .primary
        coffeeIcon.primaryDark = .primary
        coffeeIcon.lightShadow = .lightShadow
        coffeeIcon.darkShadow = .darkShadow
        coffeeIcon.layer.cornerRadius = 5
        coffeeIcon.setTitleColor(.white, for: .normal)
        }}
    @IBOutlet weak var coffinatedLabel: UILabel! { didSet {
        coffinatedLabel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        coffinatedLabel.textColor = .white
        coffinatedLabel.text = "coffienated"
        }
    }
    @IBOutlet weak var coffienatedStatus: UILabel! { didSet {
        coffienatedStatus.font = UIFont(name: "RobotoMono-Regular", size: 12)
        coffienatedStatus.textColor = .white
        coffienatedStatus.text = "LOCKED"
        }
    }
    
    
    @IBOutlet weak var beerIconImage: UIImageView! { didSet {
        beerIconImage.image = UIImage(named: "beerIcon")?.noir()
        beerIconImage.alpha = 0.3
        beerIconImage.layer.cornerRadius = 5
        beerIconImage.clipsToBounds = true
        }}
    @IBOutlet weak var beerIcon: IconButton! { didSet {
        beerIcon.primary = .primary
        beerIcon.primaryDark = .primary
        beerIcon.lightShadow = .lightShadow
        beerIcon.darkShadow = .darkShadow
        beerIcon.layer.cornerRadius = 5
        beerIcon.setTitleColor(.white, for: .normal)
        }}
    @IBOutlet weak var beernatedLAbel: UILabel! { didSet {
        beernatedLAbel.font = UIFont(name: "RobotoMono-Regular", size: 12)
        beernatedLAbel.textColor = .white
        beernatedLAbel.text = "beernated"
        }
    }
    @IBOutlet weak var beernatedStatus: UILabel! { didSet {
        beernatedStatus.font = UIFont(name: "RobotoMono-Regular", size: 12)
        beernatedStatus.textColor = .white
        beernatedStatus.text = "LOCKED"
        }
    }
    
    
    @IBOutlet weak var setDefaultButton: RBbutton! { didSet {
        setDefaultButton.primary = .primary
        setDefaultButton.primaryDark = .primary
        setDefaultButton.lightShadow = .lightShadow
        setDefaultButton.darkShadow = .darkShadow
        setDefaultButton.layer.cornerRadius = 5
        setDefaultButton.setTitle("🥚", for: .selected)
        }}
    @IBOutlet weak var setCoffeeButton: RBbutton! { didSet {
        setCoffeeButton.primary = .primary
        setCoffeeButton.primaryDark = .primary
        setCoffeeButton.lightShadow = .lightShadow
        setCoffeeButton.darkShadow = .darkShadow
        setCoffeeButton.layer.cornerRadius = 5
        setCoffeeButton.setTitle("☕️", for: .selected)
        }}
    @IBOutlet weak var setBeerButton: RBbutton! { didSet {
        setBeerButton.primary = .primary
        setBeerButton.primaryDark = .primary
        setBeerButton.lightShadow = .lightShadow
        setBeerButton.darkShadow = .darkShadow
        setBeerButton.layer.cornerRadius = 5
        setBeerButton.setTitle("🍺", for: .selected)
        }}
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        styleButtons()
        setupViews()
        setupIAP()
        
        NotificationCenter.default.addObserver(self, selector: #selector(completedPurchase), name: .IAPHelperPurchaseNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func completedPurchase() {
        if coverView != nil {
        coverView.removeFromSuperview()
        }
        setupIAP()
    }
    
    func styleButtons() {
        for btn in [setDefaultButton, setCoffeeButton, setBeerButton] {
            btn!.primary = .primary
            btn!.primaryDark = .primary
            btn!.lightShadow = .lightShadow
            btn!.darkShadow = .darkShadow
            btn!.layer.cornerRadius = 5
            btn!.isEnabled = false
            btn!.alpha = 0.2
        }
        
        let currentIcon = UIApplication.shared.alternateIconName
        switch currentIcon {
        case "CoffeeIcon": setCoffeeButton.isSelected = true
        case "BeerIcon": setBeerButton.isSelected = true
        default: setDefaultButton.isSelected = true
        }
    }
    
    func setupViews() {
        addMenuAnimation()
        self.view.backgroundColor = .primary
        
        getBeerButton.layoutSubviews()
        getCoffeeButton.layoutSubviews()
        coffeeIcon.layoutSubviews()
        beerIcon.layoutSubviews()
        defaultIcon.layoutSubviews()
        
        coffinatedLabel.alpha = 1
        beernatedLAbel.alpha = 1
        coffienatedStatus.alpha = 0.3
        beernatedStatus.alpha = 0.3
        
        // Disabling buttons
        getCoffeeButton.isEnabled = false
        getCoffeeButton.alpha = 0.5
        getBeerButton.isEnabled = false
        getBeerButton.alpha = 0.5
        
        setDefaultButton.isEnabled = true
        setDefaultButton.alpha = 1
        
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
        getBeerButton.isEnabled = true
        getBeerButton.alpha = 1
    }
    
    func setupBoughtButtons() {
        for product in products {
            if ShopProducts.store.isProductPurchased(product.productIdentifier) {
                if product.localizedTitle.contains("Coffee") {
                    coffienatedStatus.text = "✅ UNLOCKED!"
                    coffeeIconImage.alpha = 1
                    coffienatedStatus.alpha = 1
                    setCoffeeButton.isEnabled = true
                    setCoffeeButton.alpha = 1
                    coffeeIconImage.image = UIImage(named: "coffeeIcon")
                } else if product.localizedTitle.contains("Beer") {
                    beernatedStatus.text = "✅ UNLOCKED!"
                    beerIconImage.alpha = 1
                    beernatedStatus.alpha = 1
                    setBeerButton.isEnabled = true
                    setBeerButton.alpha = 1
                    beerIconImage.image = UIImage(named: "beerIcon")
                }
            }
        }
    }
    
    func purchaseInitiated() {
        coverView = UIView(frame: view.frame)
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
        animationButtonView.animation = Animation.named("menu")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(toProgress: 0.5)
    }
    
    func showProductUnavailableAlert() {
        let ac = UIAlertController(title: "Error", message: "Store seems to be closed.\nBear must have been lazy and forgot to open it 🐻", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK, i'll wait", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        delegate?.animate(menuClosed: true)
        self.dismiss(animated: true)
    }
    
    @IBAction func buyCoffeeTaped(_ sender: Any) {
        guard let productToBuy = products.first(where: {$0.productIdentifier == "com.roblack.EggTimer.onecoffee"}) else { showProductUnavailableAlert(); return }
        purchaseInitiated()
        ShopProducts.store.buyProduct(productToBuy)
    }
    
    @IBAction func buyBeerTapped(_ sender: Any) {
        guard let productToBuy = products.first(where: {$0.productIdentifier == "com.roblack.EggTimer.onebeer"}) else { showProductUnavailableAlert(); return }
        purchaseInitiated()
        ShopProducts.store.buyProduct(productToBuy)
    }
    
    @IBAction func setIconTapped(_ sender: RBbutton) {
        
        var newIconIdentifier: String?
        
        switch sender.tag {
        case 1:
            newIconIdentifier = "CoffeeIcon"
        case 2:
            newIconIdentifier = "BeerIcon"
        default:
            newIconIdentifier = nil
        }
        
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(newIconIdentifier) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Success!")
                }
            }
        }

        for btn in [setDefaultButton, setCoffeeButton, setBeerButton] {
            btn?.isSelected = false
        }
        sender.isSelected = true
    }
    
    


}
