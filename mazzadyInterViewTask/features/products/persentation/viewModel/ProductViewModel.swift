//  ProductViewModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation

class ProductsViewModel {
    
    private let getProductsUseCase: GetProductUseCaseProtocol
    private let searchProductsUseCase: SearchProductsUseCaseProtocol
    private let resetProductsSearchUseCase: ResetProductsSearchUseCaseProtocol
    
    private var products: [ProductEntity] = []
    private var filteredProducts: [ProductEntity] = []
    
    var onDataUpdated: (() -> Void)?
    
    init(getProductsUseCase: GetProductUseCaseProtocol,
         searchProductsUseCase: SearchProductsUseCaseProtocol,
         resetProductsSearchUseCase: ResetProductsSearchUseCaseProtocol) {
        self.getProductsUseCase = getProductsUseCase
        self.searchProductsUseCase = searchProductsUseCase
        self.resetProductsSearchUseCase = resetProductsSearchUseCase
    }

    func fetchProducts(completion: @escaping () -> Void) {
        getProductsUseCase.execute { [weak self] products in
            guard let self = self else { return }
            
            if let products = products {
                self.products = products
                self.filteredProducts = products
            } else {
                self.products = []
                self.filteredProducts = []
            }
            
            DispatchQueue.main.async {
                self.onDataUpdated?()
                completion()
            }
        }
    }
    
    func searchProducts(query: String) {
        filteredProducts = searchProductsUseCase.searchProducts(products: products, query: query)
        onDataUpdated?()
    }
    
    func resetSearch() {
        filteredProducts = []
        filteredProducts = resetProductsSearchUseCase.execute(products: products)
        onDataUpdated?()
    }
    
    func numberOfRows() -> Int {
        return filteredProducts.count
    }

  
    func product(at index: Int) -> ProductEntity {
        return filteredProducts[index]
    }
    
    var productList: [ProductEntity] {
        return filteredProducts
    }
}
