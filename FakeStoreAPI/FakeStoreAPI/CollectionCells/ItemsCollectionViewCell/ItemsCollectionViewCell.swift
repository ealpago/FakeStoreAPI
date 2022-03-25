//
//  ItemsCollectionViewCell.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 24.03.2022.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var priceLabel: UILabel?
    @IBOutlet var itemLabel: UILabel?
    @IBOutlet var weightLabel: UILabel?
    @IBOutlet var addButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    private var itemModel: CollectionViewItemModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView?.layer.masksToBounds = true
        self.imageView?.layer.cornerRadius = self.imageView!.frame.width/30.0
        
    }
    
    func setupCell(cellModel: CollectionViewItemModel) {
        itemModel = cellModel
        if let itemModel = itemModel {
            itemLabel?.text = itemModel.label
            priceLabel?.text = itemModel.price
            imageView?.image = UIImage(named: itemModel.imageView ?? "deneme2")
        }
    }
    
}
