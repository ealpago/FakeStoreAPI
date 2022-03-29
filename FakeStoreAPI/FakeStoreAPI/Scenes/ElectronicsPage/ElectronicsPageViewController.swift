//
//  ElectronicsPageViewController.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 29.03.2022.
//

import UIKit

class ElectronicsPageViewController: UIViewController {
    
    @IBOutlet var electronicsCollectionView: UICollectionView?
    @IBOutlet var titleLabel:UILabel?
    
    var electronicsCollectionViewCells:[CollectionViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        electronicsCollectionView?.dataSource = self
//        electronicsCollectionView?.delegate = self
    }
    
    func managingData(){
        NetworkManager.service.request(requestRoute: .products, responseModel: [FakeAPIResponse].self) { [weak self] details in
            guard let self = self else {return}
            
            var itemArray:[CollectionViewItemModel] = []
            
            for item in details{
                let itemModel = CollectionViewItemModel(cellType: .categories, imageView: "damacana2", category: item.category, label: item.title, price: "\(item.price ?? 15)")
                itemArray.append(itemModel)
            }
            self.electronicsCollectionViewCells.append(CollectionViewModel(items: itemArray))
            DispatchQueue.main.async {
                self.electronicsCollectionView?.reloadData()
            }
        }
    }
}

//extension ElectronicsPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
