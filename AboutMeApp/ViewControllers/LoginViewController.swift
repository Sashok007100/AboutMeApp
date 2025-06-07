import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let mockData = User.getMockResponse()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = mockData.username
        passwordTextField.text = mockData.password
    }
    
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
        guard usernameTextField.text == mockData.username,
              passwordTextField.text == mockData.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password",
                shouldClearField: true
            )
            return false
        }
        return true
    }
    
    // MARK: - IB Actions
    @IBAction func forgotUsernameButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(mockData.username) 😵‍💫",
            shouldClearField: false
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(mockData.password) 🫣",
            shouldClearField: false
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
        shouldClearField: Bool
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if shouldClearField {
                self.passwordTextField.text = ""
            }
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

