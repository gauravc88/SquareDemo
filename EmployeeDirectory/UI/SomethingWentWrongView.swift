//
//  SomethingWentWrongView.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class SomethingWentWrongView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(somethingWentWrongLabel)
        somethingWentWrongLabel.translatesAutoresizingMaskIntoConstraints = false
        somethingWentWrongLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        somethingWentWrongLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25).isActive = true
        
        addSubview(somethingWentWrongDescriptionLabel)
        somethingWentWrongDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        somethingWentWrongDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        somethingWentWrongDescriptionLabel.topAnchor.constraint(equalTo: somethingWentWrongLabel.bottomAnchor, constant: 25).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private let somethingWentWrongLabel: UILabel = {
        let label = UILabel()
        label.text = "Something went wrong"
        return label
    }()
    
    private let somethingWentWrongDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "We cannot process your request at this moment."
        return label
    }()
}
