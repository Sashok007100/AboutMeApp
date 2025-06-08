//
//  LoginController.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 02.06.2025.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let mockData = User.getMockResponse()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = mockData.username
        passwordTextField.text = mockData.password
    }
    
    // MARK: - Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController{
                welcomeVC.mockData = mockData
            } else if let navigationVC = viewController as? UINavigationController {
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
                
                profileVC.mockData = mockData.person
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard usernameTextField.text == mockData.username,
              passwordTextField.text == mockData.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func forgotUsernameButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(mockData.username) 😵‍💫"
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(mockData.password) 🫣"
        )
    }
    
    @IBAction func unwind(_: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    // MAKR: - Private Methods
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

