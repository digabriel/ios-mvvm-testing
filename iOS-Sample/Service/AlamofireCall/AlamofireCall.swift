//
//  AlamofireServiceCall.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift


protocol AlamofireEndpoint {
    var method: HTTPMethod {get}
    var path: String {get}
    var mockKey: String {get}
    static func withMockKey(_ key: String) -> Self?
}

protocol AlamofireRequest: URLRequestConvertible {
    var baseURL: String {get}
    var endpoint: AlamofireEndpoint {get}
    var extraHeaders: HTTPHeaders? {get}
    var params: Parameters? {get}
    var sessionManager: SessionManager {get}
}

extension AlamofireRequest {
    // Builds a URLRequest object
    func asURLRequest() throws -> URLRequest {
        // URL Construction
        let urlString = baseURL + endpoint.path
        guard let url = URL(string: urlString) else {throw ServiceError.invalidUrl(url: urlString)}
        
        // Default Headers
        var headers:HTTPHeaders = extraHeaders ?? [:]
        headers["Mock-Key"] = endpoint.mockKey
        
        var request = try URLRequest(url: url, method: endpoint.method, headers: headers)
        
        // Params encoding
        if let p = params {
            switch endpoint.method {
            case .get:
                request = try URLEncoding.default.encode(request, with: p)
            case .post:
                request = try JSONEncoding.default.encode(request, with: p)
            default:
                break
            }
        }
        
        return request
    }
}
