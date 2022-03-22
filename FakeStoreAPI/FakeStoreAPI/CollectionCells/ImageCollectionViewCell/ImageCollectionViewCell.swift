//
//  ImageCollectionViewCell.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 22.03.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let ImageCollectionViewCellIdentifier = "ImageCollectionViewCell"
    
    @IBOutlet var imageView:UIImageView?
    
    private var itemModel: CollectionViewItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(cellModel: CollectionViewItemModel) {
        itemModel = cellModel
        if let itemModel = itemModel {
            imageView?.image = UIImage(named: itemModel.imageView ?? "getir")
        }
    }

}
