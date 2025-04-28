//
//  TagsViewModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class TagsViewModel {
    
    private let getTagsUseCase: GetTagsUseCaseProtocol
    private var tags: [Tag] = []
    
    var onDataUpdated: (() -> Void)?
    init(getTagsUseCase: GetTagsUseCaseProtocol) {
        self.getTagsUseCase = getTagsUseCase
    }

    func fetchAds(completion: @escaping () -> Void) {

        getTagsUseCase.execute { [weak self] tags in
            if let tags = tags {
                self?.tags = tags
                print(tags)
            } else {
            }
            
            DispatchQueue.main.async {
                self?.onDataUpdated?()
                completion()
            }
        }
    }

    func numberOfRows() -> Int {
        return tags.count
    }

    func tag(at index: Int) -> Tag {
        return tags[index]
    }
}
