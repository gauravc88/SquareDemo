//
//  MockImageCache.swift
//  EmployeeDirectoryTests
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
@testable import EmployeeDirectory

class MockImageCache: ImageCacher {
    var insertImageCalled: Bool = false
    var imageURL: URL?
    var imageAtURLCalled: Bool = false
    var imageDataToReturn: Data?
    
    func insertImage(_ image: Data, for url: URL) {
        insertImageCalled = true
        imageURL = url
    }
    
    func removeAllImages() {
        
    }
    
    func removeImage(for url: URL) {
        
    }
    
    func image(for url: URL) -> Data? {
        imageURL = url
        imageAtURLCalled = true
        return imageDataToReturn
    }
}
