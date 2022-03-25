//
//  ItemsCategoryCollectionViewCell.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 24.03.2022.
//

import UIKit

class ItemsCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryLabel:UILabel?
    private var itemModel: CollectionViewItemModel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(cellModel: CollectionViewItemModel) {
        itemModel = cellModel
        if let itemModel = itemModel {
            categoryLabel?.text = itemModel.category
        }
    }

}
