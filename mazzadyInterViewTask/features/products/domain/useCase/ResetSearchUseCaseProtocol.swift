//
//  ResetSearchUseCaseProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
protocol ResetProductsSearchUseCaseProtocol {
    func execute(products: [ProductEntity]) -> [ProductEntity]
}
