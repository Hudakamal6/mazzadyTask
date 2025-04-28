//  ProductNetworkImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation

class ProductNetworkImpl: ProductNetworProtocol {
     static func fetchProducts(completion: @escaping ([ProductEntity]?) -> Void) {
        let urlString = ProductEndPoints.getProducts
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("API Error:", error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let productModels = try decoder.decode([ProductModel].self, from: data)
                let products = productModels.map { $0.toEntity() }

                completion(products)
                print("productss")
                print(products)
            } catch {
                print("Decoding Error:", error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
