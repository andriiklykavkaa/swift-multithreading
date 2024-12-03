//
//  ImageFilterController.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import UIKit

final class ImageFilterController: UIViewController {
    
    private let collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
    
    private func layout() {
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        collectionView.reg
    }
}
