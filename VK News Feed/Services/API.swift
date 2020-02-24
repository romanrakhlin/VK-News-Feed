//
//  API.swift
//  VK News Feed
//
//  Created by Roman Rakhlin on 09.02.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.92"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
