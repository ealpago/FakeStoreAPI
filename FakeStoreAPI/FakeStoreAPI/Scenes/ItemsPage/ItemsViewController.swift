//
//  ItemsViewController.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 24.03.2022.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton?
    @IBOutlet var categoryCollectionView: UICollectionView?
    @IBOutlet var itemsCollectionView: UICollectionView?
    @IBOutlet var filledButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        print("Back Button Tapped")
        var vc = UIViewController()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(withIdentifier: "ProductsPageViewController") as! ProductsPageViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }
    
}
