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
