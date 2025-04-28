//
//  SearchProductsUseCaseImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
class SearchProductsUseCaseImpl: SearchProductsUseCaseProtocol {
    
    func searchProducts(products: [ProductEntity], query: String) -> [ProductEntity] {
        guard !query.isEmpty else { return products }
        
        return products.filter { product in
            return product.name.lowercased().contains(query.lowercased())
        }
    }
}
