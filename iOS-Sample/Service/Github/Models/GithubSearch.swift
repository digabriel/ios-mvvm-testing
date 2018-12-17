//
//  GithubSearch.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

protocol GithubSearchResponse {
    associatedtype Item
    var items: [Item] {get set}
}

struct GithubSearch<T: Codable>: GithubSearchResponse, Codable {
    typealias Item = T
    var items: [Item]
}
