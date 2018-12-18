//
//  GithubRequest.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

protocol GithubResponse {
    func response<T: Codable>() -> Observable<T>
}

struct GithubCall: AlamofireRequest {
    let endpoint: AlamofireEndpoint
    let extraHeaders: HTTPHeaders?
    let params: Parameters?
    let sessionManager: SessionManager
    
    var baseURL: String {
        return "https://api.github.com"
    }
    
    var jsonDecoder = JSONDecoder.iso8601Decoder
    
    init (endpoint: AlamofireEndpoint,
          extraHeaders: HTTPHeaders? = nil,
          params: Parameters? = nil,
          sessionManager: SessionManager = .default) {
        
        self.endpoint = endpoint
        self.extraHeaders = extraHeaders
        self.params = params
        self.sessionManager = sessionManager
    }
}

extension GithubCall: GithubResponse {
    func response<T: Codable>() -> Observable<T> {
        return sessionManager.rx.request(urlRequest: self)
            .responseData()
            .map { (response, data) -> T in
                switch response.statusCode {
                case 200..<300:
                    
                    let decoder = self.jsonDecoder
                    let decoded = try decoder.decode(T.self, from: data)
                    return decoded
                    
                default: throw ServiceError.unknown
                }
        }
    }
}
