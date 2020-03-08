//
//  EmployeesResponse.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

struct EmployeesResponse: Decodable {
    var employees: [Employee]
}
