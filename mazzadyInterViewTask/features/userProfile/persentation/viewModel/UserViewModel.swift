//
//  UserViewModel.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import UIKit
import Foundation

class UserViewModel {
    
    @Published var user: UserEntity?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    var userImage: UIImage?
    var onImageDownloaded: (() -> Void)? // <-- Add this

    private let userUseCase: GetUserDataUseCaseProtocol

    init(userUseCase: GetUserDataUseCaseProtocol) {
        self.userUseCase = userUseCase
    }
    
    func getUserData(completion: @escaping (Bool) -> Void) {
        isLoading = true
        userUseCase.execute { [weak self] userEntity in
            DispatchQueue.main.async {
                self?.isLoading = false
                guard let self = self else { return }

                if let user = userEntity {
                    self.user = user
                    self.downloadImage(from: user.imageUrl)
                    completion(true)
                } else {
                    self.errorMessage = "Failed to fetch user data."
                    completion(false)
                }
            }
        }
    }
    
    private func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                self.userImage = UIImage(data: data)
                self.onImageDownloaded?()  // <-- Notify when image is ready
            }
        }.resume()
    }
}
