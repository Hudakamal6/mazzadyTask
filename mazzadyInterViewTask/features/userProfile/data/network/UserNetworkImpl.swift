//
//  UserNetworkImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation

class UserNetworkImpl: UserNetworkProtocol {
    static func getUserData(complitionHandler: @escaping (UserEntity?) -> Void) {
        let urlString = UserEndPoints.getUserData
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            complitionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("API Error:", error.localizedDescription)
                complitionHandler(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                complitionHandler(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userModel = try decoder.decode(UserModel.self, from: data)
                let userEntity = userModel.toEntity()
                complitionHandler(userEntity)
                print(userEntity)
            } catch {
                print("Decoding Error:", error.localizedDescription)
                complitionHandler(nil)
            }
        }
        
        task.resume()
    }
}
