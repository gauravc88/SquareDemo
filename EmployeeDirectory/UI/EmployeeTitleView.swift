//
//  EmployeeTitleView.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 4/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class EmployeeTitleView: UIView {
    var full_name: String! {
        didSet {
            nameLabel.attributedText = attributedStringForName(full_name ?? "")
        }
    }
    
    var team: String! {
        didSet {
            teamLabel.attributedText = attributedStringForTeam(team ?? "")
        }
    }
    
    let labelHeight: CGFloat = 40
    
    required init?(coder: NSCoder) {
        fatalError("Cannot be instantiated via a coder")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        configureLayout()
    }
    
    private func configureLayout() {
        configureImageview()
        configureNameLabel()
        configureTeamLabel()
    }
    
    private func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: employeeImageView.bottomAnchor, multiplier: 1).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func configureTeamLabel() {
        addSubview(teamLabel)
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
               
        teamLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 1).isActive = true
        teamLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        teamLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        teamLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func configureImageview() {
        addSubview(employeeImageView)
        employeeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        employeeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        employeeImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        employeeImageView.heightAnchor.constraint(equalTo: employeeImageView.widthAnchor).isActive = true
        employeeImageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1).isActive = true
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let teamLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let employeeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private func attributedStringForName(_ employeeName: String) -> NSAttributedString {
           let nameAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
           return NSMutableAttributedString.init(string: employeeName, attributes: nameAttributes)
    }
       
   private func attributedStringForTeam(_ teamName: String) -> NSAttributedString {
       let teamAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
       return NSMutableAttributedString.init(string: teamName, attributes: teamAttributes)
   }
}
