//
//  EmployeeImageFetcherTests.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import XCTest

@testable import EmployeeDirectory

class EmployeeImageFetcherTests: XCTestCase {
    var mockCache: MockImageCache!
    var mockURLSession: MockURLSession!
    var employeeImageFetcher: EmployeeImageFetcher!

    override func setUp() {
        mockCache = MockImageCache()
        mockURLSession = MockURLSession()
        employeeImageFetcher = EmployeeImageFetcher.init(session: mockURLSession, imageCache: mockCache)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testImageNotInCacheAndValidImageFromNetwork() {
        let imageDataString = "Some Image Data"
        let imageData = imageDataString.data(using: .utf8)
        
        mockURLSession.dataToReturn = imageData
        
        let expectation = self.expectation(description: "Expect image data to be returned from network")
        
        var returnedImageData: Data?
        
        employeeImageFetcher.fetchEmployeeImage(imageUrl: "http://test.com") { data in
            returnedImageData = data
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(imageData, returnedImageData)
        XCTAssert(mockCache.imageAtURLCalled)
        XCTAssert(mockURLSession.dataTaskCalled, "Network call for image download should be made")
    }
    
    func testImageNotInCacheAndNoImageFromNetwork() {        
        mockURLSession.dataToReturn = nil
        mockURLSession.errorToReturn = EmployeesAPIError.unknownError
        
        let expectation = self.expectation(description: "Expect image data to be returned from network")
        
        var returnedImageData: Data?
        
        employeeImageFetcher.fetchEmployeeImage(imageUrl: "http://test.com") { data in
            returnedImageData = data
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
        XCTAssert(mockCache.imageAtURLCalled)
        XCTAssertNil(returnedImageData)
        XCTAssert(mockURLSession.dataTaskCalled, "Network call for image download should be made")
    }
    
    func testImageInCache() {
        let imageDataString = "Some Image Data"
        let imageData = imageDataString.data(using: .utf8)
        mockCache.imageDataToReturn = imageData
        let expectation = self.expectation(description: "Expect image data to be returned from cache")
        
        var returnedImageData: Data?
        
        employeeImageFetcher.fetchEmployeeImage(imageUrl: "http://test.com") { data in
            returnedImageData = data
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(imageData, returnedImageData)
        XCTAssertFalse(mockURLSession.dataTaskCalled, "Network call for image download should not be made")
    }
}
