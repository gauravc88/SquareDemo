//
//  EmployeeListTableViewController.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var tableView: UITableView!
    private var noEmployeesView: NoEmployeesView!
    private var somethingWentWrongView: SomethingWentWrongView!
    
    var employeesData: [Employee]? {
        didSet {
            if let employeesData = employeesData {
                if employeesData.count == 0 {
                    // Load no employees data screen
                    DispatchQueue.main.async { [weak self] in
                        if let weakSelf = self {
                            weakSelf.view.bringSubviewToFront(weakSelf.noEmployeesView)
                        }
                    }
                } else {
                    DispatchQueue.main.async { [weak self] in
                        if let weakSelf = self {
                            weakSelf.view.bringSubviewToFront(weakSelf.tableView!)
                            weakSelf.tableView.reloadData()
                        }
                    }
                }
            } else {
               // Load Something went wrong screen
                DispatchQueue.main.async { [weak self] in
                    if let weakSelf = self {
                        weakSelf.view.bringSubviewToFront(weakSelf.somethingWentWrongView!)
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNoEmployeesView()
        setupSomethingWentWrongView()
        loadModelData()
    }

    private func loadModelData() {
        let employeeDataModel = EmployeesDataModel()
        employeeDataModel.loadData() { employeeData, error in
            self.employeesData = employeeData
            if let error = error {
                // Log Error to a logging server
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeListCell.cellReuseIdentifier, for: indexPath) as! EmployeeListCell
        if let employee = employeesData?[indexPath.row] {
            cell.employeeDetails = Employee.init(uuid: employee.uuid, full_name: employee.full_name, team: employee.team, photo_url_small: employee.photo_url_small)
            if let photo_url = employee.photo_url_small {
                EmployeeImageFetcher().fetchEmployeeImage(imageUrl: photo_url) { image in
                   if let imageData = image {
                       DispatchQueue.main.async {
                           cell.employeeImageView.image = UIImage.init(data: imageData)
                           cell.setNeedsLayout()
                       }
                   }
               }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Setup Views
    private func setupSomethingWentWrongView() {
        somethingWentWrongView = SomethingWentWrongView()
        somethingWentWrongView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(somethingWentWrongView)
        somethingWentWrongView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        somethingWentWrongView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        somethingWentWrongView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        somethingWentWrongView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.insetsContentViewsToSafeArea = true
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EmployeeListCell.self, forCellReuseIdentifier: EmployeeListCell.cellReuseIdentifier)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupNoEmployeesView() {
        noEmployeesView = NoEmployeesView()
        noEmployeesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(noEmployeesView)
        noEmployeesView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        noEmployeesView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        noEmployeesView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        noEmployeesView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
