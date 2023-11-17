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
    private let createAccountButton = CustomButton(title: "Create an account", hasBackground: true, fontSize: .medium)
    private let signInbutton = CustomButton(title: "You already have an account? Sign In", hasBackground: false, fontSize: .small)
    
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
        view.addSubview(createAccountButton)
        view.addSubview(signInbutton)
        
        view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints            = false
        username.translatesAutoresizingMaskIntoConstraints              = false
        emailField.translatesAutoresizingMaskIntoConstraints            = false
        passwordField.translatesAutoresizingMaskIntoConstraints         = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints   = false
        signInbutton.translatesAutoresizingMaskIntoConstraints          = false
        
        createAccountButton.addTarget(self, action: #selector(signUpDidTapped), for: .touchUpInside)
        signInbutton.addTarget(self, action: #selector(signInDidTapped), for: .touchUpInside)
        
        let backBarButton = UIBarButtonItem(title: "Sign Up", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
        setupConstriants()
    }
    
    // MARK: - Action
    @objc func signUpDidTapped() {
        
        let userRequest = CreateUser(
            email: self.emailField.text ?? "",
            username: self.username.text ?? "",
            password: self.passwordField.text ?? ""
        )
        print("DEBUG:--SignUpButton \(userRequest)")
        
        // Username Check
        if !Validator.isValidUsername(for: userRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        // Email Check
        if !Validator.isValidEmail(for: userRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }

        // Password Check
        if !Validator.isPasswordValid(for: userRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.CreateUser(with: userRequest) { [weak self] success, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showCreateAnAccountErrorAlert(on: self, with: error)
                return
            }
            
            if success {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = SignInController()
                }
                
            } else {
                AlertManager.showCreateAnAccountErrorAlert(on: self)
            }
        }
    }
    
    @objc func signInDidTapped() {
        let vc = SignInController()
        navigationController?.pushViewController(vc, animated: true)
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
            
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 20),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 55),
            createAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            signInbutton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 20),
            signInbutton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            signInbutton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


