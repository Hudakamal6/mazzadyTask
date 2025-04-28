//
//  TagsRepoImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class TagsRepositoryImpl: TagsRepositoryProtocol {
    private let networkService: TagsNetworkProtocol.Type
    
    init(networkService: TagsNetworkProtocol.Type = TagsNetworkImpl.self) {
        self.networkService = networkService
    }
    func fetchTags(completion: @escaping ([Tag]?) -> Void) {
           networkService.fetchTags { tags in
               completion(tags)
           }
       }
}
