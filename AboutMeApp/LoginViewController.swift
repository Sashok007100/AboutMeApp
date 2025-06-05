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
    private let user = "Aleksandr"
    private let password = "1"
    
    // MARK: - Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        
        welcomeVC?.displayedUsername = usernameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard usernameTextField.text == user,
              passwordTextField.text == password else {
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
            andMessage: "Your name is \(user) 😵‍💫"
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(password) 🫣"
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

