//
//  CheckInternetConnectionUseCaseImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
class CheckInternetConnectionUseCase: CheckInternetConnectionUseCaseProtocol {
    func execute() -> Bool {
        return InternetetworkManager.shared.isConnectedToInternet() 
    }
}
