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
    
//    var imageCollectionViewCells:[CollectionViewModel] = []
    var categoriesCollectionViewCells:[CollectionViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        imageCollectionView?.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
//        imageCollectionView?.delegate = self
//        imageCollectionView?.dataSource = self
        categoriesCollectionView?.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        categoriesCollectionView?.delegate = self
        categoriesCollectionView?.dataSource = self
        
        var collectionViewItemModelArray:[CollectionViewItemModel] = []
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))

        categoriesCollectionViewCells.append(CollectionViewModel(items: collectionViewItemModelArray))
        
        // Do any additional setup after loading the view.
    }
    
//    func managingData(){
//        NetworkManager.service.request(requestRoute: .getCategories, responseModel: FakeAPIResponse.self) { [weak self] details in
//            guard let categories = details.category else {return}
//            guard let self = self else {return}
//
//            var categoryArray:[CollectionViewItemModel] = []
//
//            for item in categories {
//                let categoryModel = CollectionViewItemModel(cellType: .categories, imageView: "damacana2", label:"Deneme")
//                categoryArray.append(categoryModel)
//            }
//            self.categoriesCollectionViewCells.append(CollectionViewModel(items: categoryArray))
//            DispatchQueue.main.async {
//                self.categoriesCollectionView?.reloadData()
//            }
//        }
//    }
}

extension ProductsPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesCollectionViewCells[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categoriesCollectionViewCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.CategoriesCollectionViewCellIdentifier, for: indexPath) as! CategoriesCollectionViewCell
        let cellModel = categoriesCollectionViewCells[indexPath.section].items[indexPath.row]!
        cell.setupCell(cellModel: cellModel)
        return cell
    }
}
