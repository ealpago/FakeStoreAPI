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
    @IBOutlet var collectionViewHeightConstraint: NSLayoutConstraint?
    
    var imageCollectionViewCells:[CollectionViewModel] = []
    var categoriesCollectionViewCells:[CollectionViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "getir"
        
        imageCollectionView?.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView?.delegate = self
        imageCollectionView?.dataSource = self
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
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        collectionViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "Damacana", price: nil))
        categoriesCollectionViewCells.append(CollectionViewModel(items: collectionViewItemModelArray))
        
        var imageViewItemModelArray:[CollectionViewItemModel] = []
        imageViewItemModelArray.append(CollectionViewItemModel(cellType: .image, imageView: "getir", category: nil, label: nil, price: nil))
        imageViewItemModelArray.append(CollectionViewItemModel(cellType: .image, imageView: "getir", category: nil, label: nil, price: nil))
        imageViewItemModelArray.append(CollectionViewItemModel(cellType: .image, imageView: "getir", category: nil, label: nil, price: nil))
        imageViewItemModelArray.append(CollectionViewItemModel(cellType: .image, imageView: "getir", category: nil, label: nil, price: nil))
        imageCollectionViewCells.append(CollectionViewModel(items: imageViewItemModelArray))
        
        imageCollectionView?.reloadData()
        categoriesCollectionView?.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.collectionViewHeightConstraint?.constant = self.categoriesCollectionView?.contentSize.height ?? 0
            self.view.layoutIfNeeded()
            self.view.setNeedsDisplay()
        }
    }
    
    //    func managingData(){
    //        NetworkManager.service.request(requestRoute: .getCategories, responseModel: FakeAPIResponse.self) { [weak self] details in
    //            guard let self = self else {return}
    //
    //            var collectionArray:[CollectionViewItemModel] = []
    //
    //            let collectionModel = CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: details.category, label: nil, price: nil)
    //            collectionArray.append(collectionModel)
    //
    //            self.categoriesCollectionViewCells.append(CollectionViewModel(items: collectionArray))
    //        }
    //    }
}

extension ProductsPageViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == imageCollectionView) {
            return imageCollectionViewCells[section].items.count
        }else{
            return categoriesCollectionViewCells[section].items.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == imageCollectionView) {
            return imageCollectionViewCells.count
        }else {
            return categoriesCollectionViewCells.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == imageCollectionView) {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.ImageCollectionViewCellIdentifier, for: indexPath) as! ImageCollectionViewCell
            let cellModel = imageCollectionViewCells[indexPath.section].items[indexPath.row]!
            cell2.setupCell(cellModel: cellModel)
            
            return cell2
            
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.CategoriesCollectionViewCellIdentifier, for: indexPath) as! CategoriesCollectionViewCell
            let cellModel = categoriesCollectionViewCells[indexPath.section].items[indexPath.row]!
            cell.setupCell(cellModel: cellModel)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == imageCollectionView) {
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 0
            }
            return CGSize(width: 390, height: 120)
        }
        return CGSize(width: 80, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        if (collectionView == categoriesCollectionView) {
        print("Collection View Tapped")
        let vc = UIStoryboard.init(name: "ItemsStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ItemsViewController") as? ItemsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        //        }
    }
}
