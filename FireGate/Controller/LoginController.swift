//
//  ViewController.swift
//  FireGate
//
//  Created by Bandit Silachai on 15/11/23.
//

import UIKit

class LoginController: UIViewController {
    private let headerView = HeaderView(title: "Sign In", subTitle: "Sign in to your account")
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", hasBackground: false, fontSize: .extraSmall)
    private let signUpbutton = CustomButton(title: "Don't have an account? Sign Up", hasBackground: false, fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(signUpbutton)
        
        view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints            = false
        emailField.translatesAutoresizingMaskIntoConstraints            = false
        passwordField.translatesAutoresizingMaskIntoConstraints         = false
        signInButton.translatesAutoresizingMaskIntoConstraints          = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints   = false
        signUpbutton.translatesAutoresizingMaskIntoConstraints          = false
        
        signInButton.addTarget(self, action: #selector(signInDidTapped), for: .touchUpInside)
        signUpbutton.addTarget(self, action: #selector(signUpDidTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotDidtapped), for: .touchUpInside)

        let backBarButton = UIBarButtonItem(title: "Sign Up", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton

        setupConstriants()
    }
    
    // MARK: - Action
    @objc func signInDidTapped() {
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc func signUpDidTapped() {
        let vc = SignUpController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func forgotDidtapped() {
        let vc = ForgotPasswordController()
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
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 20),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            forgotPasswordButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),

            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,constant: 20),
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

