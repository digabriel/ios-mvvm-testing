//
//  RepositoryService.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

struct GithubRepositoryService {
    private let sessionConfiguration: URLSessionConfiguration
    
    init(sessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    func searchRepositories(term: String, page: Int) -> Observable<[Repository]> {
        let call = GithubCall(endpoint: Endpoints.search,
                              params: ["q" : term],
                              sessionManager: SessionManager(configuration: sessionConfiguration))
        
        let response: Observable<GithubSearch<Repository>> = call.response()
        return response.map { return $0.items } 
    }
}

extension GithubRepositoryService {
    enum Endpoints: AlamofireEndpoint {
        case search
        
        var path: String {
            switch self {
            case .search:
                return "/search/repositories"
            }
        }
        
        var mockKey: String {
            switch self {
            case .search:
                return "Search-Repositories"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .search:
                return .get
            }
        }
        
        static func withMockKey(_ key: String) -> GithubRepositoryService.Endpoints? {
            switch key {
            case Endpoints.search.mockKey:
                return Endpoints.search
            default:
                return nil
            }
        }
    }
}
