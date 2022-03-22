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
    var label:String?
}

enum CellType {
    case image
    case categories
}
