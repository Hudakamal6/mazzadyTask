//
//  userModelMapper.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

import Foundation
extension UserModel {
    func toEntity() -> UserEntity {
        return UserEntity(
            id: id,
            name: name,
            imageUrl: image,
            username: userName,
            followingCount: followingCount,
            followersCount: followersCount,
            country: countryName,
            city: cityName
        )
    }
}
