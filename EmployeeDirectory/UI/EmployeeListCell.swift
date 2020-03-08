//
//  EmployeeListCell.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class EmployeeListCell: UITableViewCell {
    static let cellReuseIdentifier = "EmployeeListCell"
    let imageViewInset: CGFloat = 8.0
    let stackViewInset: CGFloat = 20.0
    
    var employeeDetails: Employee? {
        didSet {
            employeeNameLabel.attributedText = attributedStringForName(employeeDetails?.full_name ?? "")
            employeeTeamLabel.attributedText = attributedStringForTeam(employeeDetails?.team ?? "")
            employeeImageView.image = UIImage(named: "employee_placeholder")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        employeeImageView.layer.masksToBounds = true
        employeeImageView.layer.cornerRadius = employeeImageView.bounds.size.width/2
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configureImageView()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func attributedStringForName(_ employeeName: String) -> NSAttributedString {
        let nameAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        return NSMutableAttributedString.init(string: employeeName, attributes: nameAttributes)
    }
    
    private func attributedStringForTeam(_ teamName: String) -> NSAttributedString {
        let teamAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        return NSMutableAttributedString.init(string: teamName, attributes: teamAttributes)
    }
    
    private func configureImageView() {
        contentView.addSubview(employeeImageView)
        employeeImageView.translatesAutoresizingMaskIntoConstraints = false
        employeeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: imageViewInset).isActive = true
        employeeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: imageViewInset).isActive = true
        employeeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1 * imageViewInset).isActive = true
        employeeImageView.widthAnchor.constraint(equalTo: employeeImageView.heightAnchor).isActive = true
    }
    
    private func configureStackView() {
        let stackView = UIStackView.init(arrangedSubviews: [employeeNameLabel, employeeTeamLabel])
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: stackViewInset).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1 * stackViewInset).isActive = true
        stackView.leftAnchor.constraint(equalTo: employeeImageView.rightAnchor, constant: stackViewInset).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

    private let employeeNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let employeeTeamLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let employeeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}
