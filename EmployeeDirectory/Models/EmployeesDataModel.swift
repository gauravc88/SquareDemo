//
//  EmployeesModel.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
import CoreData

struct EmployeesDataModel {
    private let employeesFetcher: EmployeesFetcher
    
    init(employeesFetcher: EmployeesFetcher = EmployeesFetcher()) {
        self.employeesFetcher = employeesFetcher
    }
    
    func loadData(completionHandler: @escaping ([Employee]?, Error?) -> Void) {
        self.employeesFetcher.fetchEmployeeData(completionHandler: { result in
            switch result {
            case .failure(let error):
                completionHandler(nil, error)
            case .success(let employeesData):
                self.persistEmployeeData(employees: employeesData)
                completionHandler(employeesData, nil)
            }
        })
    }
    
    private func persistEmployeeData(employees: [Employee]) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        // TODO: Add code to update/delete before inserting new Entities.
        
        for employee in employees {
            // Save into coreData
            let entity = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
            
            entity.uuid = employee.uuid
            entity.full_name = employee.full_name
            entity.photo_url_small = employee.photo_url_small
            entity.team = employee.team
        }
        
        do {
            try context.save()
        } catch {
            fatalError("Issue with save")
        }
    }
}
