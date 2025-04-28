//
//  ProductModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
struct ProductModel: Decodable {
    let id: Int
    let name: String
    let image: String
    let price: Double
    let currency: String
    let offer: Double?
    let end_date: Double?

    func toEntity() -> ProductEntity {
        return ProductEntity(id: id, name: name, image: image, price: price, currency: currency, offer: offer, endDate: end_date)
    }
}
