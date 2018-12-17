//
//  URLSessionConfiguration+Mock.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

extension URLSessionConfiguration {
    static func mockSessionForClass(_ c: AnyClass) -> URLSessionConfiguration {
        let s = URLSessionConfiguration.ephemeral
        s.protocolClasses = [c]
        return s
    }
}
