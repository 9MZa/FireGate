//
//  RegisterController.swift
//  FireGate
//
//  Created by Bandit Silachai on 15/11/23.
//

import UIKit

class SignUpController: UIViewController {
    private let headerView = HeaderView(title: "Sign Up", subTitle: "Create your account")
    private let username = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    private let signUpbutton = CustomButton(title: "You already have an account? Sign In", hasBackground: false, fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(headerView)
        view.addSubview(username)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(signUpbutton)
        
        view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints            = false
        username.translatesAutoresizingMaskIntoConstraints              = false
        emailField.translatesAutoresizingMaskIntoConstraints            = false
        passwordField.translatesAutoresizingMaskIntoConstraints         = false
        signInButton.translatesAutoresizingMaskIntoConstraints          = false
        signUpbutton.translatesAutoresizingMaskIntoConstraints          = false
        
        signUpbutton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        
        let backBarButton = UIBarButtonItem(title: "Sign Up", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton

        setupConstriants()
    }
    
    // MARK: - Action
    @objc func buttonDidTapped() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


    // MARK: - Constriants
    private func setupConstriants() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            username.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            username.heightAnchor.constraint(equalToConstant: 55),
            username.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            emailField.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 20),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
 
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signUpbutton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpbutton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            signUpbutton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


