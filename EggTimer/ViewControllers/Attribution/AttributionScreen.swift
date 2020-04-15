//
//  UIViewController.swift
//  EggTimer
//
//  Created by Emin Roblack on 12/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit

class AttributionScreen: UIViewController {

    
    let attrCell = String(describing: attributionTVC.self)
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        tableView.clipsToBounds = true
        tableView.register(UINib(nibName: attrCell, bundle: nil), forCellReuseIdentifier: attrCell)
        }}
    @IBOutlet weak var closeBtn: UIButton! { didSet {
        closeBtn.tintColor = .primary
        }}
    
    @IBOutlet weak var titleLabel: UILabel! { didSet {
        titleLabel.font = UIFont(name: "RobotoMono-Bold", size: 20)
        titleLabel.textColor = .primary
        titleLabel.text = "Attribution Time".uppercased()
        }}
    @IBOutlet weak var subtitleLabel: UILabel! { didSet {
        subtitleLabel.font = UIFont(name: "RobotoMono-Bold", size: 12)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.text = "All these awesome humans below have supplied assets used in this app."
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
 
    @objc func reload() {
        tableView.reloadData()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

extension AttributionScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appAttributors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: attrCell, for: indexPath) as! attributionTVC
        cell.iconImageBtn.layoutSubviews()
        cell.attributer = appAttributors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        UIApplication.shared.open(appAttributors[indexPath.row].assetUrl())
    }
    
}
