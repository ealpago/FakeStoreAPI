//
//  CategoriesCollectionViewCell.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 22.03.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let CategoriesCollectionViewCellIdentifier = "CategoriesCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var categoryName: UILabel?

    private var itemModel: CollectionViewItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.layer.masksToBounds = true
        self.imageView?.layer.cornerRadius = self.imageView!.frame.width/10.0
        // Initialization code
    }

    func setupCell(cellModel: CollectionViewItemModel) {
        itemModel = cellModel
        if let itemModel = itemModel {
            categoryName?.text = itemModel.category
            imageView?.image = UIImage(named: itemModel.imageView ?? "deneme2")
        }
    }
    
}
