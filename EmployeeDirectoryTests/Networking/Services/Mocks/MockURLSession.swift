//
//  MockURLSession.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

class MockDataTask: URLSessionDataTask {
    var resumeCalled: Bool = false
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
       resumeCalled = true
       closure()
    }
}

class MockURLSession: URLSession {
    var dataToReturn: Data?
    var errorToReturn: Error?
    var responseToReturn: URLResponse?
    var dataTaskCalled: Bool = false
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCalled = true
        return MockDataTask() { [weak self] in
            completionHandler(self?.dataToReturn, self?.responseToReturn, self?.errorToReturn)
        }
    }
}
