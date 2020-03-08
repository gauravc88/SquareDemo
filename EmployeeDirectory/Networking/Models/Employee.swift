//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

struct Employee: Decodable {
    var uuid: String
    var full_name: String
    var team: String
    var photo_url_small: String?
}
