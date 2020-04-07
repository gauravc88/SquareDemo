//
//  CoreDataManager.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 4/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {
        //
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EmployeeDirectory")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
}
