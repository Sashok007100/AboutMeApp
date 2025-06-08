//
//  BiographyViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 08.06.2025.
//

import UIKit

final class BiographyViewController: UIViewController {

    @IBOutlet var bioTitleLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    
    var mockData: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setupGradient()
        
        bioTitleLabel.text = "\(mockData.title) Bio"
        bioLabel.text = mockData.bio
    }
}
