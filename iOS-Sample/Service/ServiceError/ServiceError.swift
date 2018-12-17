//
//  ServiceError.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case invalidUrl(url: String)
    case timeout
    case noConnection
    case unknown
    
    static func withNSError(_ nserror: NSError) -> ServiceError {
        
        switch nserror.code {
        case -1001: return .timeout
        case -1009: return .noConnection
        default: return .unknown
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl(let url): return "Invalid request URL: \(url)"
        case .timeout: return "The request timed out."
        case .noConnection: return "The Internet connection appears to be offline."
        case .unknown: return "Unknown error."
        }
    }
}
