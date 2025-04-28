//
//  AdsRepoProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
protocol AdsRepositoryProtocol {
    func fetchAdvertisements(completion: @escaping ([Advertisement]?) -> Void)
}
