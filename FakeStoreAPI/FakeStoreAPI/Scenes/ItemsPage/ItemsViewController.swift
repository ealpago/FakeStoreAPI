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
    
//    lazy var view0: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        let label = UILabel()
//        label.text = "Kategori"
//        label.textAlignment = .center
//        view.addSubview(label)
//        return view
//    }()
//    lazy var view1: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        let label = UILabel()
//        label.text = "Kategori"
//        label.textAlignment = .center
//        view.addSubview(label)
//        return view
//    }()
//    lazy var view2: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        let label = UILabel()
//        label.text = "Kategori"
//        label.textAlignment = .center
//        view.addSubview(label)
//        return view
//    }()
//
//    lazy var views = [view0, view1, view2]
//    
//    lazy var categoryCollectionViewExample: UICollectionView = {
//        let collectionView = UICollectionView()
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isPagingEnabled = true
//        collectionView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count) , height: view.frame.height)
//        
//        for i in 0..<views.count {
//            collectionView.addSubview(views[i])
//            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
//        }
//        collectionView.delegate = self
//        return collectionView
//    }()
    
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
    
        _ = BaseButton()
//        button.layer.cornerRadius
        managingData()
        managingCategoryLabelData()
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
    
    func managingCategoryLabelData(){
        NetworkManager.service.request(requestRoute: .getCategories, responseModel: [String].self) { [weak self] details in
            guard let self = self else {return}

            var categoryArray:[CollectionViewItemModel] = []

            for item in details{
                let categoryModel = CollectionViewItemModel(cellType: .label, imageView: nil, category: item, label: nil, price: nil)
                categoryArray.append(categoryModel)
            }
            self.categoriesCollectionViewCells.append(CollectionViewModel(items: categoryArray))
            DispatchQueue.main.async {
                self.categoryCollectionView?.reloadData()
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

