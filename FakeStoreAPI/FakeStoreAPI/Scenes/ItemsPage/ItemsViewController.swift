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
        
//        var itemsViewItemModelArray:[CollectionViewItemModel] = []
//        for _ in 0...30 {
//            itemsViewItemModelArray.append(CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: "kategori", label: "damacana", price: "tl12"))
//        }
//        itemsCollectionViewCell.append(CollectionViewModel(items: itemsViewItemModelArray))
        
        var categoriesModelArray:[CollectionViewItemModel] = []
        for _ in 0...30 {
            categoriesModelArray.append(CollectionViewItemModel(cellType: .label, imageView: nil, category: "Kategori", label: nil, price: nil))
        }
        categoriesCollectionViewCells.append(CollectionViewModel(items: categoriesModelArray))
        
        managingData()
    }
    
    func managingData(){
        NetworkManager.service.request(requestRoute: .products, responseModel: [FakeAPIResponse].self) { [weak self] details in
            guard let self = self else {return}

            var itemArray:[CollectionViewItemModel] = []

            for item in details{
                let itemModel = CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: item.category, label: item.title, price: "\(item.price ?? 15)")
                itemArray.append(itemModel)
            }
            self.itemsCollectionViewCell.append(CollectionViewModel(items: itemArray))
            DispatchQueue.main.async {
                self.itemsCollectionView?.reloadData()
            }
        }
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

