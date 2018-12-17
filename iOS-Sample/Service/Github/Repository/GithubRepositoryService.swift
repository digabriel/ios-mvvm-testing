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

protocol GithubRepositoryServiceType {
    func searchRepositories(term: String, page: Int) -> Observable<[Repository]>
}

struct GithubRepositoryService: GithubRepositoryServiceType {
    func searchRepositories(term: String, page: Int) -> Observable<[Repository]> {
        let call = GithubCall(method: .get, path: "/search/repositories", params: ["q" : term])
        let response: Observable<GithubSearch<Repository>> = call.response()
        return response.map { return $0.items } 
    }
}
