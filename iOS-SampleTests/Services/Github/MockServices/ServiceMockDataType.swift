//
//  ServiceMockData.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

protocol ServiceMockDataType {
    var jsonMockFile: String {get}
    var mockData: Data {get}
}

extension ServiceMockDataType {
    var mockData: Data {
        let url = Bundle(for: GithubRepositoryServiceSpecs.self)
            .url(forResource: jsonMockFile, withExtension: "json")!
        return try! Data(contentsOf: url)
    }
}
