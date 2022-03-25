//
//  CollectionViewModel.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 22.03.2022.
//

import Foundation

struct CollectionViewModel {
    var items:[CollectionViewItemModel?] = []
}

struct CollectionViewItemModel {
    var cellType:CellType
    var imageView:String?
    var category:String?
    var label:String?
    var price:String?
}

enum CellType {
    case image
    case categories
    case label
}
