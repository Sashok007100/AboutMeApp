//
//  WelcomeController.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 03.06.2025.
//Add commentMore actions

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var greetingUserLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var mockData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setupGradient()
        
        greetingUserLabel.text = "Welcome, \(mockData.username)!"
        nameLabel.text = "My name is \(mockData.person.firstName) \(mockData.person.secondName)."
    }
}

extension UIView {
    func setupGradient() {
        let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [
                UIColor.systemIndigo.cgColor,
                UIColor.systemRed.cgColor,
                UIColor.systemBlue.cgColor
            ]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint   = CGPoint(x: 1, y: 1)

            layer.insertSublayer(gradient, at: 0)
    }
}
