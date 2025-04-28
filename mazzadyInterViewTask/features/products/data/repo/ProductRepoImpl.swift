//
//  ProductRepoImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
class ProductRepoImpl: ProductReopProtocol {
    private let networkService: ProductNetworProtocol.Type
    
    init(networkService: ProductNetworProtocol.Type = ProductNetworkImpl.self) {
        self.networkService = networkService
    }

    func getProducts(completion: @escaping ([ProductEntity]?) -> Void) {
        networkService.fetchProducts { products in
            completion(products)
        }
       }
    
}
