//
//  ItemsViewController.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 24.03.2022.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet var categoryCollectionView: UICollectionView?
    @IBOutlet var itemsCollectionView: UICollectionView?
    @IBOutlet var filledButton: UIButton?
    
    var itemsCollectionViewCell:[CollectionViewModel] = []
    var categoriesCollectionViewCells:[CollectionViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ürünler"
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        itemsCollectionView?.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        itemsCollectionView?.delegate = self
        itemsCollectionView?.dataSource = self
        categoryCollectionView?.register(UINib(nibName: "ItemsCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCategoryCollectionViewCell")
        categoryCollectionView?.delegate = self
        categoryCollectionView?.dataSource = self
        
        var itemsViewItemModelArray:[CollectionViewItemModel] = []
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
        itemsCollectionViewCell.append(CollectionViewModel(items: itemsViewItemModelArray))
        
        var categoriesModelArray:[CollectionViewItemModel] = []
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        categoriesCollectionViewCells.append(CollectionViewModel(items: categoriesModelArray))
        
        
        // Do any additional setup after loading the view.
    }
}

extension ItemsViewController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == itemsCollectionView){
            return itemsCollectionViewCell[section].items.count
        } else {
            return categoriesCollectionViewCells[section].items.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == itemsCollectionView){
            return itemsCollectionViewCell.count
        } else {
            return categoriesCollectionViewCells.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == itemsCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
            let cellModel = itemsCollectionViewCell[indexPath.section].items[indexPath.row]!
            cell.setupCell(cellModel: cellModel)
            return cell
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCategoryCollectionViewCell", for: indexPath) as! ItemsCategoryCollectionViewCell
            let cell2Model = categoriesCollectionViewCells[indexPath.section].items[indexPath.row]!
            cell2.setupCell(cellModel: cell2Model)
            return cell2
        }
    }
    
    
}

