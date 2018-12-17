//
//  GithubRepositoryServiceSpecs.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Quick
import Nimble
import RxSwift

@testable import iOS_Sample

extension GithubRepositoryService.Endpoints: ServiceMockDataType {
    var jsonMockFile: String {
        switch self {
        case .search:
            return "github_repository_search"
        }
    }
}

class GithubRepositoryServiceSpecs: QuickSpec {
    override func spec() {
        describe("GithubRepositoryServiceSpecs") {
            
            let service = GithubRepositoryService(sessionConfiguration: URLSessionConfiguration.mockSessionForClass(GithubRepositoryMockURLProtocol.self))
            
            context("when searching repositories") {
                
                var disposeBag: DisposeBag!
                
                beforeEach {
                    disposeBag = DisposeBag()
                }
                
                context("with a valid request") {
                    it("should search for a term and return a populated list of repositores") {
                        var repositories: [Repository]?
                        
                        service.searchRepositories(term: "", page: 1)
                            .subscribe(onNext: {
                                reps in
                                repositories = reps
                            })
                            .disposed(by: disposeBag)
                        
                        expect(repositories).toEventuallyNot(beEmpty())
                        expect(repositories?.count).toEventually(equal(2))
                    }
                }
            }
        }
    }
}
