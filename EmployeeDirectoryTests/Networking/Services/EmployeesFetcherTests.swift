//
//  EmployeesFetcherTests.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import XCTest
@testable import EmployeeDirectory

class EmployeesFetcherTests: XCTestCase {
    var mockURLSession: MockURLSession!
    var employeesFetcher: EmployeesFetcher!
    
    override func setUp() {
        mockURLSession = MockURLSession()
        employeesFetcher = EmployeesFetcher.init(session: mockURLSession)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyData() {
        let employeesResponse = "{\"employees\": []}"
        
        mockURLSession.dataToReturn = employeesResponse.data(using: .utf8)
        let expectation = self.expectation(description: "Expect empty data to be returned")
        var returnedEmployees: [Employee]?
        
        employeesFetcher.fetchEmployeeData(completionHandler: { result in
            switch result {
            case .failure:
                returnedEmployees = nil
            case .success(let data):
                returnedEmployees = data
            }
            expectation.fulfill()
        })
        
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(0, returnedEmployees!.count)
    }
    
    func testMalformedData() {
        let employeesResponse = "{\"employees\": \"abc\"}"
        
        mockURLSession.dataToReturn = employeesResponse.data(using: .utf8)
        let expectation = self.expectation(description: "Expect empty data to be returned")
        var returnedEmployees: [Employee]?
        
        employeesFetcher.fetchEmployeeData(completionHandler: { result in
            switch result {
            case .failure:
                returnedEmployees = nil
            case .success(let data):
                returnedEmployees = data
            }
            expectation.fulfill()
        })
        
        self.wait(for: [expectation], timeout: 5)
        XCTAssertNil(returnedEmployees)
    }
    
    func testValidData() {
        let employeesResponse = "{\"employees\": [{\"uuid\": \"1234\",\"team\":\"Square\",\"full_name\":\"Jack Dorsey\",\"photo_url_small\": \"http://test.com\"}]}"
        
        mockURLSession.dataToReturn = employeesResponse.data(using: .utf8)
        let expectation = self.expectation(description: "Expect empty data to be returned")
        var returnedEmployees: [Employee]?
        
        employeesFetcher.fetchEmployeeData(completionHandler: { result in
            switch result {
            case .failure:
                returnedEmployees = nil
            case .success(let data):
                returnedEmployees = data
            }
            expectation.fulfill()
        })
        
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(1, returnedEmployees!.count)
        let firstEmployee = returnedEmployees?.first
        XCTAssertNotNil(firstEmployee)
        XCTAssertEqual("1234", firstEmployee!.uuid)
        XCTAssertEqual("Square", firstEmployee!.team)
        XCTAssertEqual("Jack Dorsey", firstEmployee!.full_name)
        XCTAssertEqual("http://test.com", firstEmployee!.photo_url_small)
    }
}
