//
//  JSONDecoder.swift
//  iOS-Sample
//
//  Created by Dimas on 18/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var iso8601Decoder: JSONDecoder {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        return d
    }
}
