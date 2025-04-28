//
//  GetUserDataUseCase.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
class GetUserDataUseCaseImpl: GetUserDataUseCaseProtocol {
    
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (UserEntity?) -> Void) {
        repository.getUser { userEntity in
            completion(userEntity)
        }
    }
}
