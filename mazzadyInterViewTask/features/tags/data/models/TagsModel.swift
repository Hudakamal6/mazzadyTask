//
//  TagsModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

struct TagsResponse: Codable {
    let tags: [Tag]
}

struct Tag: Codable {
    let id: Int
    let name: String
}
