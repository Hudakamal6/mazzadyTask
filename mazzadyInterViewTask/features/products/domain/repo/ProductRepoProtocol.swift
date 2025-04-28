//
//  ProductRepoProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
protocol ProductReopProtocol {
    func getProducts(completion: @escaping ([ProductEntity]?) -> Void)
}
