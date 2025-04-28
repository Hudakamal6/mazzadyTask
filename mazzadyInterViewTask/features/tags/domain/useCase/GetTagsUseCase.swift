//
//  GetTagsUseCase.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class GetTagsUseCaseImpl: GetTagsUseCaseProtocol {
    private let repository: TagsRepositoryProtocol
    
    init(repository: TagsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Tag]?) -> Void) {
        repository.fetchTags { tags in
            completion(tags)
        }
    }
}
