//
//  SearchProductsUseCaseProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation

protocol SearchProductsUseCaseProtocol {
    func searchProducts(products: [ProductEntity], query: String) -> [ProductEntity]
}
