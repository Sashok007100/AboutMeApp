//
//  WelcomeController.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 03.06.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var greetingUserLabel: UILabel!
    
    var displayedUsername: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
        
        greetingUserLabel.text = "Welcome, \(displayedUsername ?? "Username")!"
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
            gradient.frame = view.bounds
            gradient.colors = [
                UIColor.systemBlue.cgColor,
                UIColor.systemRed.cgColor
            ]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint   = CGPoint(x: 0, y: 1)

            view.layer.insertSublayer(gradient, at: 0)
    }
}
