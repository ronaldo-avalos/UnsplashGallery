//
//  ApiClient.swift
//  UnsplashGallery
//
//  Created by ronaldo avalos on 05/10/24.
//

import Foundation


class ApiClient {
    private let apikey = "ApiKey"
    private let baseURL = "https://api.unsplash.com"
    
    func fetchPhotos(complition: @escaping ([UnsplashPhoto]?, Error?) -> Void) {
        let url = URL(string: "\(baseURL)/photos?client_id=\(apikey)&per_page=30")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(nil, error)
                return
            }
            
            guard let data = data else {
                complition(nil, NSError(domain: "DetailError", code: -10001, userInfo: nil))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
              //   print("Received JSON: \(jsonString)")
             }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let photos = try decoder.decode([UnsplashPhoto].self, from: data)
                complition(photos, nil)
            } catch {
                complition(nil, error)
            }
        }.resume()
    }
    
}
