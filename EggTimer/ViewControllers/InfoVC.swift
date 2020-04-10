//
//  InfoVC.swift
//  EggTimer
//
//  Created by Emin Grbo on 7/13/19.
//  Copyright © 2019 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie

class InfoVC: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var roundView: UIView! { didSet {
        roundView.layer.cornerRadius = 25
        roundView.backgroundColor = .primaryDark
//        roundView.addShadow(offset: .zero, color: .primaryDark, radius: 5, opacity: 0.8)
        }}
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var scrollView            : UIScrollView!
    @IBOutlet var animationButtonView   : AnimationView!
    @IBOutlet var animationStepperView  : AnimationView!
    @IBOutlet var gotItBtn              : RBbutton! { didSet {
        gotItBtn.setTitle("i think i got it", for: .normal)
        gotItBtn.primary = .primary
        gotItBtn.primaryDark = .primary
        gotItBtn.lightShadow = .lightShadow
        gotItBtn.darkShadow = .darkShadow
        gotItBtn.setTitleColor(.white, for: .normal)
        }}
    weak var delegate                   : InfoVCDelegate?
    
    var instructionSlides: [Slide] = []
    var instructionSlideViews: [InstructionsSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addMenuAnimation()
        setupSlides()
        setupScrollView()
        gotItBtn.layoutSubviews()
        scrollView.delegate = self
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    private func setupViews() {
        containerView.backgroundColor = .primary
//        buyMeDrinksBtn.titleLabel?.font = UIFont(name: "RobotoMono-Regular", size: 16)
    }
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menu")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(toProgress: 0.5)
        
        animationStepperView.animation = Animation.named("slider")
    }
    
    func setupSlides() {
        let slide1 = Slide(image: "step1", text: "Eggs in water, 1inch(2.5cm)\ndeeper than the eggs height.\nDo not turn on the timer yet.")
        let slide2 = Slide(image: "step2", text: "Let the water come to a boil and then REMOVE from the stove.")
        let slide3 = Slide(image: "step3", text: "Start the timer and wait for the notification or a sound.")
        
        instructionSlides += [slide1, slide2, slide3]
        
        for slide in instructionSlides {
            let currentSlide: InstructionsSlide = Bundle.main.loadNibNamed("InstructionsSlide", owner: self, options: nil)?.first as! InstructionsSlide
            currentSlide.animationView.animation = Animation.named(slide.image)
            currentSlide.instructionLabel.text = slide.text
            instructionSlideViews.append(currentSlide)
        }
    }
    
    func setupScrollView() {
        // Height it handeled in storyboard, here only width is modified.
        scrollView.frame = view.frame
        scrollView.contentSize.width = view.frame.width * CGFloat(instructionSlideViews.count)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< instructionSlideViews.count {
            instructionSlideViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(instructionSlideViews[i])
            
            instructionSlideViews[i].animationView.loopMode = .loop
            instructionSlideViews[i].animationView.play()
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var progress = scrollView.contentOffset.x / scrollView.contentSize.width
        // Preventing animation from going under 0
        
//        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut , animations: {
//            self.roundView.transform = CGAffineTransform(scaleX: 2.7, y: 1)
//        })
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut , animations: {
            self.roundView.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
        })
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut , animations: {
            self.roundView.transform = CGAffineTransform.identity
        })
        
        if progress < 0 {
            progress = 0
        }
        animationStepperView.currentProgress = AnimationProgressTime(progress)
    }

    @IBAction func closeTapped(_ sender: Any) {
        animationButtonView.play(toProgress: 1)
        delegate?.animate(menuClosed: false)
        self.dismiss(animated: true)
    }
    
    @IBAction func gitItBtnTapped(_ sender: Any) {
        animationButtonView.play(toProgress: 1)
        delegate?.animate(menuClosed: false)
        self.dismiss(animated: true)
    }
    
    

}
