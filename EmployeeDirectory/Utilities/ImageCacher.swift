//
//  ImageCacher.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation

protocol ImageCacher {
    // Retrieves an image from Cache as Data
    func image(for url: URL) -> Data?
    
    // Insert a new image into the Cache
    func insertImage(_ image: Data,for url: URL)
    
    // Remove image from cache
    func removeImage(for url: URL)
    
    // Remove all images from Cache
    func removeAllImages()
}
