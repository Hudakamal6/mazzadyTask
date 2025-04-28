//
//  GetAdsUseCase.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

protocol GetAdvertisementsUseCaseProtocol {
    func execute(completion: @escaping ([Advertisement]?) -> Void)
}
