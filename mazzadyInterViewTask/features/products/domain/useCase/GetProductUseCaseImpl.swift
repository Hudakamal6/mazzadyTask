//
//  GetProductUseCaseImpl\.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
class GetProductsUseCaseImpl: GetProductUseCaseProtocol {
   
    
    private let repository: ProductReopProtocol
    
    init(repository: ProductReopProtocol) {
        self.repository = repository
    }
    func execute(completion: @escaping ([ProductEntity]?) -> Void) {
        repository.getProducts { products in
            completion(products)
        }
    }

}
