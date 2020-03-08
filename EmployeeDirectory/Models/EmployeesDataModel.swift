//
//  EmployeesModel.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

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
                completionHandler(employeesData, nil)
            }
        })
    }
}
