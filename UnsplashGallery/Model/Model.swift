//
//  Model.swift
//  UnsplashGallery
//
//  Created by ronaldo avalos on 05/10/24.
//

import Foundation


struct UnsplashPhoto: Decodable {
    let id: String
    let altDescription: String?
    let urls: PhotoUrls
}

struct PhotoUrls: Decodable {
    let small: String
}
