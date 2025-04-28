//
//  GetAdsUseCase.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class GetAdvertisementsUseCaseImpl: GetAdvertisementsUseCaseProtocol {
    private let repository: AdsRepositoryProtocol
    
    init(repository: AdsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Advertisement]?) -> Void) {
        repository.fetchAdvertisements { ads in
            completion(ads)
        }
    }
}
