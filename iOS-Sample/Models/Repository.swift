//
//  Repository.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

struct Repository {
    var id: Int
    var name: String
    var isPrivate: Bool
    var url: String
}

extension Repository: Codable {
    enum CodingKeys:String, CodingKey {
        case id
        case name
        case isPrivate = "private"
        case url
    }
}

extension Repository: Equatable {
    static func == (lhs: Repository, rhs: Repository) -> Bool {
        return lhs.id == rhs.id
    }
}
