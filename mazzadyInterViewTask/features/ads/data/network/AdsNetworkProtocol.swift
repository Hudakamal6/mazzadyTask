//
//  AdsNetwork.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

protocol AdvertisementNetworkProtocol {
    static func fetchAdvertisements(completion: @escaping ([Advertisement]?) -> Void)
}
