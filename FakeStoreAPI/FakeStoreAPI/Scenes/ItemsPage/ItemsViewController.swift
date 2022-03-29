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
    @IBOutlet var pageViewController: UIPageViewController?
    @IBOutlet var viewPager: UIView?
    var list:[UIViewController] = []
    
    var itemsCollectionViewCell:[CollectionViewModel] = []
    var categoriesCollectionViewCells:[CollectionViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ürünler"
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let option: [UIPageViewController.OptionsKey:UIPageViewController.SpineLocation] = [UIPageViewController.OptionsKey.spineLocation: UIPageViewController.SpineLocation.max]

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: option)
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
        
        for _ in 1 ... 5 {
            let vc = UIViewController()
            vc.view.backgroundColor = randomColor()
            list.append(vc)
        }

        pageViewController?.setViewControllers([list[0]], direction: .forward, animated: false, completion: nil)
        pageViewController?.view.frame = viewPager?.bounds ?? .zero
        
        self.addChild(pageViewController!)
        viewPager?.addSubview((pageViewController?.view)!)
        pageViewController?.didMove(toParent: self)
        
        itemsCollectionView?.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        itemsCollectionView?.delegate = self
        itemsCollectionView?.dataSource = self
        categoryCollectionView?.register(UINib(nibName: "ItemsCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCategoryCollectionViewCell")
        categoryCollectionView?.delegate = self
        categoryCollectionView?.dataSource = self
        
        _ = BaseButton()
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

extension ItemsViewController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = list.firstIndex(of: viewController) {
            if index > 0 {
                return list[index - 1]
            } else {
                return nil
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = list.firstIndex(of: viewController) {
            if index < list.count - 1 {
                return list[index + 1]
            } else {
                return nil
            }
        }
        return nil
    }
}

