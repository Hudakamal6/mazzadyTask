//
//  TagsNetworkImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
class TagsNetworkImpl: TagsNetworkProtocol {
    static func fetchTags(completion: @escaping ([Tag]?) -> Void) {
        let urlString = TagsEndPoints.getTags
        
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
                let response = try decoder.decode(TagsResponse.self, from: data)
                completion(response.tags)
                print(response.tags)
            } catch {
                print("Decoding Error:", error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
