//
//    Rating.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Rating : Codable {
    
    let count : Int?
    let rate : Float?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case rate = "rate"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        rate = try values.decodeIfPresent(Float.self, forKey: .rate)
    }
}
