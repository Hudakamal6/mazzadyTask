//
//  UserRepo.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
protocol UserRepositoryProtocol {
    func getUser(completion: @escaping (UserEntity?) -> Void)
}
