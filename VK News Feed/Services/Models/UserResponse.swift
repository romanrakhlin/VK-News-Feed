//
//  UserResponse.swift
//  VK News Feed
//
//  Created by Roman Rakhlin on 09.02.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let firstName: String
    let lastName: String
    let photo100: String?

    var name: String { return firstName + " " + lastName }
}
