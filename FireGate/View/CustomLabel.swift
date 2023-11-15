//
//  CustomLabel.swift
//  FireGate
//
//  Created by Bandit Silachai on 15/11/23.
//

import UIKit

class CustomLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.textColor = .secondaryLabel
        self.textAlignment = .right
        self.font = .systemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
