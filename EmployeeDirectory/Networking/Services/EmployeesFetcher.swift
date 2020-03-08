//
//  EmployeesFetcher.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

enum EmployeesAPIError: Error {
    case serverError
    case unknownError
}

struct EmployeesFetcher {
    // Can be configured in a config file
    let employeesURLPath = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    //let employeesURLPath = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    //let employeesURLPath = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchEmployeeData(completionHandler: @escaping (Result<[Employee], EmployeesAPIError>) -> Void) {
        guard let employeesURL = URL.init(string: employeesURLPath) else {
            fatalError("Malformed URL to fetch employee data")
        }
        let dataRequest = URLRequest.init(url: employeesURL)
        let dataTask = session.dataTask(with: dataRequest, completionHandler: { data, _, _ in
            guard let jsonData = data else {
                completionHandler(.failure(.serverError))
                return
            }
            
            do {
                let employeesData = try JSONDecoder().decode(EmployeesResponse.self, from: jsonData)
                completionHandler(.success(employeesData.employees))
            } catch {
                completionHandler(.failure(.unknownError))
            }
        })
        dataTask.resume()
    }
}
