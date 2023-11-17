//
//  AlertService.swift
//  FireGate
//
//  Created by Bandit Silachai on 17/11/23.
//

import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            vc.present(alertController, animated: true)
        }
    }
}

// MARK: - Show Validation Alerts
extension AlertManager {
    
    static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email.")
    }
    
    static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid Username.")
    }
    
    static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid Password.")
    }
}

// MARK: - Create an account Errors

extension AlertManager {
    static func showCreateAnAccountErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Create an account Error", message: nil)
    }
    
    static func showCreateAnAccountErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Create an account Error", message: error.localizedDescription)
    }
}

// MARK: - SignIn Errors
extension AlertManager {
    static func signInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Sign In Error", message: nil)
    }
    
    static func signInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Sign In Error", message: error.localizedDescription)
    }
}

// MARK: - SignOut Errors
extension AlertManager {
    static func signOutErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Sign Out Error", message: nil)
    }
    
    static func signOutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Sign Out Error", message: error.localizedDescription)
    }
}

// MARK: - Forgot Password

// MARK: - Fetching User Errors
