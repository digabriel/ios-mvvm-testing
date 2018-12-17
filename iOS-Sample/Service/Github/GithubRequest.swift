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

struct GithubCall: AlamofireCall {
    let method: HTTPMethod
    let path: String
    let headers: HTTPHeaders?
    let params: Parameters?
    
    var baseURL: String {
        return "https://api.github.com"
    }
    
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    init (method: HTTPMethod, path: String, headers: HTTPHeaders? = nil, params: Parameters? = nil) {
        self.method = method
        self.path = path
        self.headers = headers
        self.params = params
    }
    
    func response<T: Codable>() -> Observable<T> {
        return RxAlamofire.requestData(self)
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
