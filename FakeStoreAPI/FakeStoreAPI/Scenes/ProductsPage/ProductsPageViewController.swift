//
//  ProductsPageViewController.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 21.03.2022.
//

import UIKit

class ProductsPageViewController: UIViewController {

    @IBOutlet var imageCollectionView: UICollectionView?
    @IBOutlet var categoriesCollectionView: UICollectionView?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        imageCollectionView?.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
//        imageCollectionView?.delegate = self
//        imageCollectionView?.dataSource = self
//        categoriesCollectionView?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
//        categoriesCollectionView?.delegate = self
//        categoriesCollectionView?.dataSource = self
        // Do any additional setup after loading the view.
    }
}
//
//extension ProductsPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}
