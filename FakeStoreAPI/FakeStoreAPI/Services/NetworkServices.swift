//
//  NetworkServices.swift
//  FakeStoreAPI
//
//  Created by Emre Alpago on 21.03.2022.
//

import Foundation

//https://fakestoreapi.com/

public enum HTTPMethod:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum NetworkRouter{
    case products
    case productByID(id:Int)
    case getCategories
    case productByCategories(category:String)
    case productLimit(limit:Int)
    
    public var method:HTTPMethod{
        switch self {
        case .products:
            return .get
        case .productByID(_):
            return .get
        case .getCategories:
            return .get
        case .productByCategories(_):
            return .get
        case .productLimit(_):
            return .get
        }
    }
    
    public var path:String{
        switch self {
        case .products:
            return "https://raw.githubusercontent.com/ealpago/apiJson/master/fakeStore.json"
        case .productByID(let id):
            return APIConstants.shared.fakeStoreBaseURL + "products/\(id)"
        case .getCategories:
            return "https://raw.githubusercontent.com/ealpago/apiCategories/master/apiCategories.json"
        case .productByCategories(let category):
            return APIConstants.shared.fakeStoreBaseURL + "products/category/\(category)"
        case .productLimit(let limit):
            return APIConstants.shared.fakeStoreBaseURL + "products?limit=\(limit)"
        }
    }
}

class NetworkManager {
    static let service = NetworkManager()
    public func request<T: Codable>(requestRoute: NetworkRouter, responseModel:T.Type, completion:@escaping (_ details: T) -> Void){
        if let url = URL(string: requestRoute.path){
            var request = URLRequest(url: url)
            request.httpMethod = requestRoute.method.rawValue
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                do {
                    let data = try JSONDecoder().decode(T.self, from: data!)
                    completion(data)
                } catch let e as NSError {
                    print("error : \(e)")
                }
            }
            task.resume()
        }
    }
}
