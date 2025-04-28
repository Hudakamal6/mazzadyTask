//
//  TagsNetworkProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
protocol TagsNetworkProtocol {
    static func fetchTags(completion: @escaping ([Tag]?) -> Void)
}
