//
//  ForgotPasswordViewController.swift
//  FireGate
//
//  Created by Bandit Silachai on 15/11/23.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = HeaderView(title: "Forgot Password", subTitle: "Reset password for your account")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    
    // MARK: - UI Setup
    func setupUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        setupConstriants()
    }
    
    
    // MARK: - Constraints
    private func setupConstriants() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    // MARK: - Action
    
}
