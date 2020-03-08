//
//  ImageCacheTests.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import XCTest
@testable import EmployeeDirectory

class ImageCacheTests: XCTestCase {
    var imageCache: ImageCache!
    
    override func setUp() {
        self.imageCache = ImageCache()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageForURLNoImageExists() {
        let url = URL.init(string: "http://localhost")
        XCTAssert(imageCache.image(for: url!) == nil, "Image cannot exist in the cache before its inserted")
    }
    
    func testImageForURLAfterImageSaved() {
        let url = URL.init(string: "http://localhost")
        let imageDataString = "SomeImageData"
        let imageData = imageDataString.data(using: String.Encoding.ascii)
        imageCache.insertImage(imageData!, for: url!)
        
        let cachedImage = imageCache.image(for: url!)
        XCTAssert(cachedImage != nil, "Image should not be nil")
        XCTAssertEqual(cachedImage, imageData)
    }
    
    func testRemoveImage() {
        let url = URL.init(string: "http://localhost")
        let imageDataString = "SomeImageData"
        let imageData = imageDataString.data(using: String.Encoding.ascii)
        imageCache.insertImage(imageData!, for: url!)
        imageCache.removeImage(for: url!)
        
        XCTAssert(imageCache.image(for: url!) == nil, "Image data still found in cache. Expected image data to be deleted")
    }
    
    func testRemoveAllImages() {
        let url = URL.init(string: "http://localhost")
        let imageDataString = "SomeImageData"
        let imageData = imageDataString.data(using: String.Encoding.ascii)
        imageCache.insertImage(imageData!, for: url!)
        
        let url2 = URL.init(string: "http://localhost")
        imageCache.insertImage(imageData!, for: url2!)
        
        imageCache.removeAllImages()
        
        XCTAssert(imageCache.image(for: url!) == nil, "Image data still found in cache. Expected image data to be deleted")
        XCTAssert(imageCache.image(for: url2!) == nil, "Image data still found in cache. Expected image data to be deleted")
    }
}
