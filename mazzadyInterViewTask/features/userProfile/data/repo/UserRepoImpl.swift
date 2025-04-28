//
//  UserRepoImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
class UserRepositoryImpl: UserRepositoryProtocol {
    
    private let networkService: UserNetworkProtocol.Type
    
    init(networkService: UserNetworkProtocol.Type = UserNetworkImpl.self) {
        self.networkService = networkService
    }
    
    func getUser(completion: @escaping (UserEntity?) -> Void) {
        networkService.getUserData { userEntity in
            completion(userEntity)
        }
    }
}
