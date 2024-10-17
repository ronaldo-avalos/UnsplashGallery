//
//  ViewController.swift
//  UnsplashGallery
//
//  Created by ronaldo avalos on 05/10/24.
//

import UIKit

class UnsplashViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel = UnsplashViewModel()
    private let tableView = UITableView()
    private let imageCache = NSCache<NSString, UIImage>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        
    }
    
    
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.showError = { error in
            print(error)
        }
        
        viewModel.fetchPhotos()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOFItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let photo = viewModel.photos(at: indexPath.row)
                
        if let cachedImage = imageCache.object(forKey: photo.urls.small as NSString) {
            cell.configCell(with: cachedImage, and: photo.altDescription)
        } else {
            fetchImage(for: photo, at: indexPath)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = viewModel.photos(at: indexPath.row)
        print(photo)
    }


    
    private func fetchImage(for photo: UnsplashPhoto, at indexPath: IndexPath) {
        guard let url = URL(string: photo.urls.small) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageCache.setObject(image, forKey: photo.urls.small as NSString)
                    if let cell = self?.tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
                        cell.configCell(with: image, and: photo.altDescription)
                    }
                }
            }
        }.resume()
    }
    
}
