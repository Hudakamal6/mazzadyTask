//
//  ResetSearchUseCaseImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
class ResetProductsSearchUseCaseImpl: ResetProductsSearchUseCaseProtocol {
    
   
    
    func execute(products: [ProductEntity]) -> [ProductEntity] {
           // Simply returns the full products list again
           return products
       }
}
