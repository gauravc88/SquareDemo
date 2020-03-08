//
//  EmployeesDataModelTests.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import XCTest
@testable import EmployeeDirectory

class EmployeesDataModelTests: XCTestCase {
    var employeesDataModel: EmployeesDataModel!
    var employeesFetcher: EmployeesFetcher!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        mockURLSession = MockURLSession()
        employeesFetcher = EmployeesFetcher.init(session: mockURLSession)
        employeesDataModel = EmployeesDataModel.init(employeesFetcher: employeesFetcher)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmployeesFetcherError() {
        mockURLSession.errorToReturn = EmployeesAPIError.serverError
        let expectation = self.expectation(description: "Employee fetcher should return nil")
        
        var returnedEmployees: [Employee]?
        employeesDataModel.loadData(completionHandler: { employees, error in
            returnedEmployees = employees
            expectation.fulfill()
        })
        self.wait(for: [expectation], timeout: 5)
        XCTAssertNil(returnedEmployees)
    }
    
    func testEmployeesFetcherValidData() {
        let employeesResponse = "{\"employees\": [{\"uuid\": \"1234\",\"team\":\"Square\",\"full_name\":\"Jack Dorsey\",\"photo_url_small\": \"http://test.com\"}]}"
        mockURLSession.dataToReturn = employeesResponse.data(using: .utf8)
        
        let expectation = self.expectation(description: "Employee fetcher should return valid data")
        
        var returnedEmployees: [Employee]?
        employeesDataModel.loadData(completionHandler: { employees, error in
            returnedEmployees = employees
            expectation.fulfill()
        })
        self.wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(returnedEmployees)
        XCTAssertEqual(1, returnedEmployees!.count)
        let firstEmployee = returnedEmployees!.first
        XCTAssertNotNil(firstEmployee)
        XCTAssertEqual("1234", firstEmployee!.uuid)
        XCTAssertEqual("Square", firstEmployee!.team)
        XCTAssertEqual("Jack Dorsey", firstEmployee!.full_name)
        XCTAssertEqual("http://test.com", firstEmployee!.photo_url_small)
    }

}
