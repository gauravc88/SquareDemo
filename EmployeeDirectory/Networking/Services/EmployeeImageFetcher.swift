//
//  EmployeeImageFetcher.swift
//  EmployeeDirectory
//
//  Created by Gaurav Chitroda on 3/7/20.
//  Copyright © 2020 Gaurav Chitroda. All rights reserved.
//

import Foundation
import UIKit

class EmployeeImageFetcher {
    private let imageCache: ImageCacher
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared, imageCache: ImageCacher = ImageCache()) {
        self.session = session
        self.imageCache = imageCache
    }
    
    func fetchEmployeeImage(imageUrl: String, completionHandler: @escaping (Data?) -> Void) {
        guard let imageURL = URL.init(string: imageUrl) else {
            fatalError("Malformed URL to fetch employee image")
        }
        
        // Find in Cache first else load from Network
        if let imageData = imageCache.image(for: imageURL) {
            completionHandler(imageData)
        } else {
            loadImageFromNetwork(imageUrl: imageURL) { result in
               switch result {
               case .failure(let error):
                   // Log Error to logging service
                   completionHandler(nil)
               case .success(let imageData):
                    // Set image in cache
                    self.imageCache.insertImage(imageData, for: imageURL)
                    completionHandler(imageData)
               }
           }
        }
    }
    
    private func loadImageFromNetwork(imageUrl: URL, completionHandler: @escaping (Result<Data, EmployeesAPIError>) -> Void) {
        let dataRequest = URLRequest.init(url: imageUrl)
        let dataTask = session.dataTask(with: dataRequest, completionHandler: { data, _, _ in
            guard let jsonData = data else {
                completionHandler(.failure(.serverError))
                return
            }
            completionHandler(.success(jsonData))
        })
        dataTask.resume()
    }
}
