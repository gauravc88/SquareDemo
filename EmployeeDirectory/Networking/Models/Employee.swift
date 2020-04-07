//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
import CoreData

class Employee: NSManagedObject, Decodable {
    @NSManaged var uuid: String
    @NSManaged var full_name: String
    @NSManaged var team: String
    @NSManaged var photo_url_small: String?
    @NSManaged var email_address: String?
    @NSManaged var phone_number: String?
    @NSManaged var biography: String?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case full_name
        case team
        case photo_url_small
        case biography
        case email_address
        case phone_number
    }
    
    required convenience init(from decoder: Decoder) throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context) else {
            fatalError("Cannot load entity")
        }

        self.init(entity: entity, insertInto: nil)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid)!
        self.full_name = try container.decodeIfPresent(String.self, forKey: .full_name)!
        self.team = try container.decodeIfPresent(String.self, forKey: .team)!
        self.photo_url_small = try container.decodeIfPresent(String.self, forKey: .photo_url_small)
        self.biography = try container.decodeIfPresent(String.self, forKey: .biography)
        self.email_address = try container.decodeIfPresent(String.self, forKey: .email_address)
        self.phone_number = try container.decodeIfPresent(String.self, forKey: .phone_number)
    }
}
