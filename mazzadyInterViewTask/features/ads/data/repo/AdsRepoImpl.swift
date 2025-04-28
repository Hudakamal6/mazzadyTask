//
//  AdsRepoImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class AdsRepositoryImpl: AdsRepositoryProtocol {
    private let networkService: AdvertisementNetworkProtocol.Type
    
    init(networkService: AdvertisementNetworkProtocol.Type = AdvertisementNetworkImpl.self) {
        self.networkService = networkService
    }
    func fetchAdvertisements(completion: @escaping ([Advertisement]?) -> Void) {
           networkService.fetchAdvertisements { ads in
               completion(ads)
           }
       }
}
