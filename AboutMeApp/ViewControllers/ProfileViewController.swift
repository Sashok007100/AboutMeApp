//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 08.06.2025.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var avatarImageView: UIImageView!
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var secondNameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    // MARK: - Public Properties
    var mockData: Person!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setupGradient()
        
        title = mockData.title
        avatarImageView.image = UIImage(named: mockData.image)
        
        firstNameLabel.text = "Имя: \(mockData.firstName)"
        secondNameLabel.text = "Фамилия: \(mockData.secondName)"
        cityLabel.text = "Город: \(mockData.city)"
    }
    
    override func viewDidLayoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageView.clipsToBounds = true
    }
    
    // MARK: - Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let biographyVC = segue.destination as? BiographyViewController else { return }
        
        biographyVC.mockData = mockData
    }
}
