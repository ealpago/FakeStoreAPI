//
//  ItemsViewController.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 24.03.2022.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet var categoryCollectionView: UICollectionView?
    @IBOutlet var pageViewController: UIPageViewController?
    @IBOutlet var viewPager: UIView?
    var list:[UIViewController] = []
    
    var categoriesCollectionViewCells:[CollectionViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ürünler"
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let option: [UIPageViewController.OptionsKey:UIPageViewController.SpineLocation] = [UIPageViewController.OptionsKey.spineLocation: UIPageViewController.SpineLocation.max]
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: option)
        pageViewController?.delegate = self
        pageViewController?.dataSource = self
        
        for index in 1...5{
            let storyboard = UIStoryboard(name: "ElectronicsStoryBoard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ElectronicsPageViewController") as! ElectronicsPageViewController
            vc.titleLabel?.text = "\(index)"
            list.append(vc)
        }
        
        pageViewController?.setViewControllers([list[0]], direction: .forward, animated: false, completion: nil)
        pageViewController?.view.frame = viewPager?.bounds ?? .zero
        
        self.addChild(pageViewController!)
        viewPager?.addSubview((pageViewController?.view)!)
        pageViewController?.didMove(toParent: self)
        
        categoryCollectionView?.register(UINib(nibName: "ItemsCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCategoryCollectionViewCell")
        categoryCollectionView?.delegate = self
        categoryCollectionView?.dataSource = self
        
        _ = BaseButton()
        
        managingCategoryLabelData()
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
        return categoriesCollectionViewCells[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categoriesCollectionViewCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCategoryCollectionViewCell", for: indexPath) as! ItemsCategoryCollectionViewCell
        let cell2Model = categoriesCollectionViewCells[indexPath.section].items[indexPath.row]!
        cell2.setupCell(cellModel: cell2Model)
        return cell2
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

