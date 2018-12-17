//
//  BaseMockURLProtocol.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

class BaseMockURLProtocol: URLProtocol {
    enum MockURLProtocolError: Error {
        case noMockKey
        case noEndpoint(mockKey: String)
        
        var localizedDescription: String {
            switch self {
            case .noMockKey:
                return "Can't find a Mock-Key request header field"
            case .noEndpoint(let mockKey):
                return "Could not find an Endpoint with for this Mock-Key: \(mockKey)"
            }
        }
    }
    
    override  class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    var mockKey: String? {
        guard let mockKey = request.value(forHTTPHeaderField: "Mock-Key") else {
            client?.urlProtocol(self, didFailWithError: MockURLProtocolError.noMockKey)
            return nil
        }
        
        return mockKey
    }
}
