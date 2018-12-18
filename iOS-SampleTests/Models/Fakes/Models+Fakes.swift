//
//  Models+Fakes.swift
//  iOS-SampleTests
//
//  Created by Dimas on 18/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
@testable import iOS_Sample

extension Repository {
    static func fake(id: Int) -> Repository {
        let r = Repository(id: id,
                           name: "Testing",
                           isPrivate: false,
                           url: "http://www.google.com")
        
        return r
    }
}
