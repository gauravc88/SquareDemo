//
//  NoEmployeesView.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class NoEmployeesView: UIView {
    let backgroundImageViewWidth: CGFloat = 400
    let backgroundImageViewHeight: CGFloat = 400
    let employeesLabelInset: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupBackgroundImageView()
        setupNoEmployeesLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupBackgroundImageView(){
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImageView.widthAnchor.constraint(equalToConstant: backgroundImageViewWidth).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: backgroundImageViewHeight).isActive = true
    }
    
    private func setupNoEmployeesLabel() {
        addSubview(noEmployeesLabel)
        noEmployeesLabel.translatesAutoresizingMaskIntoConstraints = false
        noEmployeesLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 10).isActive = true
        noEmployeesLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noEmployeesLabel.heightAnchor.constraint(equalToConstant: employeesLabelInset).isActive = true
        noEmployeesLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        noEmployeesLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "employee_placeholder"))
        return imageView
    }()
    
    private let noEmployeesLabel: UILabel = {
        let label = UILabel()
        label.text = "No Employees found."
        label.textAlignment = .center
        return label
    }()
}
