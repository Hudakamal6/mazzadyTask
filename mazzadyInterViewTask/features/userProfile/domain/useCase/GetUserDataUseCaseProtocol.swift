//
//  GetUserDataUseCaseProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
protocol GetUserDataUseCaseProtocol {
    func execute(completion: @escaping (UserEntity?) -> Void)
}
