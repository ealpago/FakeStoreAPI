//  FakeAPIResponse.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 21.03.2022.
//

import Foundation

struct FakeAPIResponse : Codable {
    
    let category : String?
    let descriptionField : String?
    let id : Int?
    let image : String?
    let price : Float?
    let rating : Rating?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case descriptionField = "description"
        case id = "id"
        case image = "image"
        case price = "price"
        case rating
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        price = try values.decodeIfPresent(Float.self, forKey: .price)
        rating = try Rating(from: decoder)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
