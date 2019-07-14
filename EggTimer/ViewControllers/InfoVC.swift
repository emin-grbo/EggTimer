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


    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var animationButtonView: AnimationView!
    @IBOutlet var animationStepperView: AnimationView!
    @IBOutlet var buyMeDrinksBtn: RBbutton!
    weak var delegate: InfoVCDelegate?
    
    var instructionSlides: [Slide] = []
    var instructionSlideViews: [InstructionsSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addMenuAnimation()
        setupSlides()
        setupScrollView()
        
        scrollView.delegate = self
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default // .default
    }
    
    
    private func setupViews() {
        buyMeDrinksBtn.backgroundColor = UIColor(displayP3Red: 54/255, green: 9/255, blue: 178/255, alpha: 1)
        buyMeDrinksBtn.titleLabel?.font = UIFont(name: "RobotoMono-Regular", size: 16)
    }
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menuBlack")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(toProgress: 0.5)
        
        animationStepperView.animation = Animation.named("slider")
    }
    
    func setupSlides() {
        let slide1 = Slide(image: "step1", text: "Eggs in water, 1inch(2.5cm)  deeper than the eggs height.")
        let slide2 = Slide(image: "step2", text: "Let the come to a boil and then REMOVE from the stove.")
        let slide3 = Slide(image: "step3", text: "Start the timer and wait for the notification.")
//        instructionSlides = []
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
        if progress < 0 {
            progress = 0
        }
        animationStepperView.currentProgress = AnimationProgressTime(progress)
    }

    @IBAction func closeTapped(_ sender: Any) {
        animationButtonView.play(toProgress: 1)
        delegate?.animate()
        self.dismiss(animated: true)
    }
    

}
