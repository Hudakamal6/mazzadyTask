//
//  GetProductsUsCaseProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
protocol GetProductUseCaseProtocol {
    func execute(completion: @escaping ([ProductEntity]?) -> Void)
}
