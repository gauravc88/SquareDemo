//
//  ImageCache.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
import UIKit

class ImageCache: ImageCacher {
    private var internalCache = NSCache<NSURL, NSData>()
    
    func insertImage(_ imageData: Data, for url: URL) {
        internalCache.setObject(imageData as NSData, forKey: url as NSURL)
    }
    
    func removeImage(for url: URL) {
        internalCache.removeObject(forKey: url as NSURL)
    }
    
    func removeAllImages() {
        internalCache.removeAllObjects()
    }
    
    func image(for url: URL) -> Data? {
        if let imageData = internalCache.object(forKey: url as NSURL) {
            return imageData as Data
        } else {
            return nil
        }
    }
}
