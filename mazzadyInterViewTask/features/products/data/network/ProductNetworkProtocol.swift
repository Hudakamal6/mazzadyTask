//
//  ProductNetworkProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
protocol ProductNetworProtocol {
    static func fetchProducts(completion: @escaping ([ProductEntity]?) -> Void)
}
