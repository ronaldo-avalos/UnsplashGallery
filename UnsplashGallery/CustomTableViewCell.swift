//
//  CustomTableViewCell.swift
//  UnsplashGallery
//
//  Created by ronaldo avalos on 05/10/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let imageV = UIImageView()
    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        imageV.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageV)
        contentView.addSubview(descriptionLabel)
        
        // Constraints for imageView
        NSLayoutConstraint.activate([
            imageV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageV.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageV.widthAnchor.constraint(equalToConstant: 50),
            imageV.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Constraints for descriptionLabel
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 10),
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func configCell(with image: UIImage, and description: String?) {
        imageV.image = image
        descriptionLabel.text = description
    }
}
