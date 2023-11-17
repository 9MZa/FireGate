//
//  HomeController.swift
//  FireGate
//
//  Created by Bandit Silachai on 15/11/23.
//

import UIKit
import FirebaseAuth

class HomeController: UIViewController {
    
    // MARK: - UI Components
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .light)
        
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .medium)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [welcomeLabel, nameLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        
        
        // MARK: - Constriants
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
        ])
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    // MARK: - UI Setup
    func setupUI() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(signOut))
        
        setupConstriants()
        
        AuthService.shared.getUser { user, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.welcomeLabel.text = "Welcome"
                self.nameLabel.text = user?.username
            }
        }
    }
    
    
    // MARK: - Constriants
    private func setupConstriants() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    // MARK: - SignOut
    @objc func signOut() {
        AuthService.shared.signOut { error in
            if let error {
                AlertManager.signOutErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegete = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegete.checkAuthentication()
            }
        }
    }
}
