//
//  AdsModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

struct AdsResponse: Codable {
    let advertisements: [Advertisement]
}

struct Advertisement: Codable {
    let id: Int
    let image: String
}
