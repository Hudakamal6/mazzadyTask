//
//  AdsNetworkImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

class AdvertisementNetworkImpl: AdvertisementNetworkProtocol {
    static func fetchAdvertisements(completion: @escaping ([Advertisement]?) -> Void) {
        let urlString = AdsEndPoints.getAds
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("API Error:", error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(AdsResponse.self, from: data)
                completion(response.advertisements)
                print(response.advertisements)
            } catch {
                print("Decoding Error:", error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
