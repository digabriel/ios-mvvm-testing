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

protocol AlamofireCall: URLRequestConvertible {
    var baseURL: String {get}
    var method: HTTPMethod {get}
    var path: String {get}
    var headers: HTTPHeaders? {get}
    var params: Parameters? {get}
}

extension AlamofireCall {
    func asURLRequest() throws -> URLRequest {
        let urlString = baseURL + path
        guard let url = URL(string: urlString) else {throw ServiceError.invalidUrl(url: urlString)}
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        
        if let p = params {
            switch method {
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
