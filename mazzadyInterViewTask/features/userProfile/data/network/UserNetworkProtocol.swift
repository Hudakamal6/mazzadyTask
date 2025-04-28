//
//  UserNetworkServices.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
protocol UserNetworkProtocol {
    static func getUserData(complitionHandler : @escaping (UserEntity?) -> Void)
    
}
