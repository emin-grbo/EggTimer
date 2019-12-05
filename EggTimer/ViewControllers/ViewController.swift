//
//  ViewController.swift
//  EggTimer
//
//  Created by Emin Roblack on 11/25/18.
//  Copyright © 2018 emiN Roblack. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation
import UserNotifications

class ViewController: UIViewController, UIScrollViewDelegate {
 
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet var animationButtonView: AnimationView!
    
  let notificationCenter = UNUserNotificationCenter.current()
    
  let animationView = AnimationView(name: "data")
  let eggStates = ["r u n n y", "m e d i u m", "h a r d"]
  var timeRemaining = 60
  var timer = Timer()
  let circleView = UIView(frame: CGRect(x: UIScreen.main.bounds.width - 60, y: 50, width: 50, height: 50))
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupScrollView()
    setupTimer()
    addMenuAnimation()
    setupAnimation()
    addCircleAnim()
    
    startButton.setTitle("start", for: .normal)
    startButton.setTitle("cancel", for: .selected)
  }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }

    @objc func tickTock() {
        if timeRemaining != 0 {
            timeRemaining -= 1
        } else {
            resetTimer()
            #warning("sound here")
            // to play sound
            eggDone()
//            AudioServicesPlaySystemSound (1329)
            timer.invalidate()
        }
        timerLabel.text = "\(formattedTime(timeRemaining))"
    }
    
    
    func addMenuAnimation() {
        animationButtonView.animation = Animation.named("menu")
        animationButtonView.backgroundColor = .clear
        animationButtonView.contentMode = .scaleAspectFit
        animationButtonView.play(fromProgress: 0.5, toProgress: 1, loopMode: .playOnce, completion: nil)
    }
    
    func eggDone() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let customAlert = storyboard.instantiateViewController(withIdentifier: "alert") as! AlertVC
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        self.present(customAlert, animated: true)
    }
  
    func formattedTime(_ totalSeconds: Int) -> String {
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
  
  func setupScrollView() {
    scrollView.delegate = self
    scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(eggStates.count),
                                    height: scrollView.frame.size.height)
    
    for item in 0 ... eggStates.count-1 {
      let label = UILabel(frame: CGRect(x: (scrollView.contentSize.width / CGFloat(eggStates.count)) * CGFloat(item),
                                        y: 0,
                                        width: self.scrollView.contentSize.width / CGFloat(eggStates.count),
                                        height: 24))
      label.text = eggStates[item]
      label.textAlignment = .center
      label.textColor = UIColor.white
      label.font = UIFont(name: "RobotoMono-Bold", size: 16)
      
      scrollView.addSubview(label)
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let progress = scrollView.contentOffset.x / scrollView.contentSize.width
    animationView.currentProgress = AnimationProgressTime(progress)
    setupTimer()
  }
  
  
  
  func setupAnimation() {
    view.addSubview(animationView)
    self.view.sendSubviewToBack(animationView)
    
    animationView.sizeTo(superView: scrollView)

    animationView.loopMode = .loop
    
    animationView.frame = CGRect(x: 0, y: 80, width: view.bounds.size.width , height: scrollView.frame.height)
    animationView.bounds.size.width = view.bounds.size.width * 0.5
    animationView.contentMode = .center
  }
  
  
  
  func setupTimer() {
    timer.invalidate()
    
    switch scrollView.currentPage {
    case 1:
        #warning("testing time")
      timeRemaining = 5
    case 2:
      timeRemaining = 420
    case 3:
      timeRemaining = 600
    default:
      timeRemaining = 0
    }
    timerLabel.text = formattedTime(timeRemaining)
  }
    
    func addCircleAnim() {
        circleView.alpha = 0
        circleView.isUserInteractionEnabled = false
        circleView.backgroundColor = .background
        circleView.layer.cornerRadius = 25
        self.view.addSubview(circleView)
    }

  
  
  
  @IBAction func startTimerBTN(_ sender: Any) {
    startButton.isSelected.toggle()
    if !timer.isValid {
        startTimer()
    } else {
        resetTimer()
    }
  }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tickTock), userInfo: nil, repeats: true)
        scrollView.isScrollEnabled = false
        registerLocalNotification()
    }
    
    func resetTimer() {
        scrollView.isScrollEnabled = true
        timer.invalidate()
        setupTimer()
    }

    
    @IBAction func InfoButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoPage = storyboard.instantiateViewController(withIdentifier: "info") as! InfoVC
        infoPage.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        infoPage.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        #warning("Vrlo bitno za boju statusBara. Koristi se zato sto presentation style nije .fullscreen")
        infoPage.modalPresentationCapturesStatusBarAppearance = true
        
        infoPage.delegate = self
        
        // MARK: Animate circleThing
        UIView.animate(withDuration: 0.3) {
            self.circleView.alpha = 1
            self.circleView.transform = CGAffineTransform(scaleX: 40, y: 40)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.present(infoPage, animated: true)
        }
        
    }
}


extension ViewController: InfoVCDelegate, AlertVCDelegate {
    func animate() {
        animationButtonView.play(fromProgress: 0.5, toProgress: 1, loopMode: .playOnce, completion: nil)
        circleView.alpha = 0
        circleView.transform = .identity
    }
    
    func reset() {
        resetTimer()
    }
}



extension ViewController: UNUserNotificationCenterDelegate {
    
    
    
    func registerLocalNotification() {
        
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
                self.scheduleNotification()
            } else {
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Permission needed", message: "To schedule an alarm for the timer, you need to grant us permission to send alerts", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(ac, animated: true)
                }
            }
        }
    }
    
    func scheduleNotification() {
        registerCategories()
        print("Scheduling...")
        
        // not required, but useful for testing!
        notificationCenter.removeAllPendingNotificationRequests()
        
        // Modifying content to show on the alert
        let content = UNMutableNotificationContent()
        content.title = "Your eggs are ready!"
        content.body = "Get them out of the hot water for Christs sake!"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "show"]
        content.sound = UNNotificationSound.default
        
        let date = Date()
        var dateComponents = DateComponents()
        let calendar = Calendar.current
        
        let seconds = calendar.component(.second, from: date)
        
        #warning("testing seconds")
        dateComponents.second = seconds + 5
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        print(dateComponents)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
    }
    
    func registerCategories() {
        notificationCenter.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        notificationCenter.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock; do nothing
                print("Default identifier")
                notificationCenter.removeAllDeliveredNotifications()
                notificationCenter.removeAllPendingNotificationRequests()
            case "show":
                print("Show more information…")
                
            default:
                break
            }
        }
        // you need to call the completion handler when you're done
        completionHandler()
    }
    
    
}

