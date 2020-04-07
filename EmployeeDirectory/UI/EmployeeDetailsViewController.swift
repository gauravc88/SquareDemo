//
//  EmployeeDetailsViewController.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 4/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
    var employee: Employee!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configureTitleView()
        configureCommunicationView()
    }
    
    private func configureTitleView() {
        view.addSubview(titleView)
        if let photo_url = employee.photo_url_small {
            EmployeeImageFetcher().fetchEmployeeImage(imageUrl: photo_url) { image in
               if let imageData = image {
                   DispatchQueue.main.async { [weak self] in
                    self?.titleView.employeeImageView.image = UIImage.init(data: imageData)
                    self?.titleView.setNeedsLayout()
                   }
               }
           }
        }
        titleView.full_name = employee.full_name
        titleView.team = employee.team
        
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func configureCommunicationView() {
        view.addSubview(communicationView)
        
        communicationView.phone_number = employee.phone_number
        communicationView.email_address = employee.email_address
        
        communicationView.translatesAutoresizingMaskIntoConstraints = false
        communicationView.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 1).isActive = true
        communicationView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        communicationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        communicationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private let titleView: EmployeeTitleView = {
        let titleView = EmployeeTitleView.init(frame: .zero)
        return titleView
    }()
    
    private let communicationView: EmployeeCommunicationView = {
        let commView = EmployeeCommunicationView.init(frame: .zero)
        return commView
    }()
}
