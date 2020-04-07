//
//  EmployeeCommunicationView.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 4/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class EmployeeCommunicationView: UIView {
    let heightConstant: CGFloat = 50
    
    var phone_number: String! {
        didSet {
            callButton.titleLabel?.text = phone_number
        }
    }
    
    var email_address: String! {
        didSet {
            emailButton.titleLabel?.text = email_address
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    private func configureLayout() {
        configureEmailbutton()
        configureCallbutton()
    }
    
    private func configureEmailbutton() {
        addSubview(emailButton)
        
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 1).isActive = true
        emailButton.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1).isActive = true
        emailButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
    private func configureCallbutton() {
           addSubview(callButton)
           
           callButton.translatesAutoresizingMaskIntoConstraints = false
           callButton.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 1).isActive = true
        callButton.topAnchor.constraint(equalToSystemSpacingBelow: emailButton.bottomAnchor, multiplier: 1).isActive = true
           callButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
           callButton.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
       }
    
    private let emailButton: UIButton = {
        let button = UIButton.init(frame: .zero)
        button.backgroundColor = .red
        return button
    }()
    
    private let callButton: UIButton = {
       let button = UIButton.init(frame: .zero)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .red
       return button
   }()
    
    private let textButton: UIButton = {
       let button = UIButton.init(frame: .zero)
       return button
   }()
}
