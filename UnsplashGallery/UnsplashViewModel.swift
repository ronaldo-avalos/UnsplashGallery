//
//  UnsplashViewModel.swift
//  UnsplashGallery
//
//  Created by ronaldo avalos on 05/10/24.
//

import Foundation


class UnsplashViewModel {
    private let api = ApiClient()
    private var photos: [UnsplashPhoto] = []
    
    //closure de tipo callback
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    
    func fetchPhotos() {
        api.fetchPhotos { [weak self] responsePhotos, error in
            guard let self = self else {return}
            if let error = error {
                showError?(error.localizedDescription)
            }
            
            photos = responsePhotos ?? []
            print(photos)
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    
    func numberOFItems() -> Int {
        return photos.count
    }
    //En tu caso, como estás manejando imágenes desde una API como Unsplash, es más robusto usar el id de la imagen para cualquier operación que necesite identificar una imagen de manera única, como guardar en caché o manejar selecciones en la vista. El índice del array debería usarse solo para tareas relacionadas con la iteración o la posición de la vista en pantalla.
    func photos(at index: Int) -> UnsplashPhoto {
        return photos[index]
      
    }
}

    
    
