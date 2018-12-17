//
//  RepositoryMocks.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

@testable import iOS_Sample

class GithubRepositoryMockURLProtocol: BaseMockURLProtocol {
    override func startLoading() {
        if let mockKey = self.mockKey {
            guard let endpoint = GithubRepositoryService.Endpoints.withMockKey(mockKey) else {
                client?.urlProtocol(self, didFailWithError: MockURLProtocolError.noEndpoint(mockKey: mockKey))
                return
            }
            
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let data = endpoint.mockData
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        }
    }
    
    override func stopLoading() {
        
    }
}
