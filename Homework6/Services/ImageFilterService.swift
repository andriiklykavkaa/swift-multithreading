//
//  ImageFilterService.swift
//  Homework6
//
//  Created by Andrii Klykavka on 01.12.2024.
//

import UIKit

fileprivate let imageNames = [
    "image1",
    "image2",
    "image3",
    "image4",
    "image5",
    "image6",
    "image7",
    "image8",
    "image9"
]

final class ImageFilterService {
    private var images: [UIImage] = []
    
    private func loadImages() {
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                images.append(image)
            }
        }
    }
    
    private func applyFilters() -> [UIImage] {
        let threadNumber = images.count
        var filteredImages: [UIImage] = []
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        let syncQueue = DispatchQueue(label: "syncQueue")
        
        for index in 0..<threadNumber {
            
            let image = images[index]
            
        }
        
        return filteredImages
    }
}
