//
//  SearchViewModel.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel {
    let search: AnyObserver<String>
    let results: Observable<[RepositoryViewModel]>
    let isSearching = BehaviorSubject<Bool>(value: false)
    
    private let disposeBag = DisposeBag()
    
    init() {
        let searchPS = PublishSubject<String>()
        self.search = searchPS.asObserver()
        
        results = searchPS.flatMapLatest { term -> Observable<[Repository]> in
            guard !term.isEmpty else {return Observable<[Repository]>.just([])}
            let s = GithubRepositoryService()
            return s.searchRepositories(term: term, page: 1)
        }
        .map {$0.map {RepositoryViewModel(model: $0)}}
        .share()
        
        searchPS.map{_ in true}
            .bind(to: isSearching)
            .disposed(by: disposeBag)
        
        results.map{_ in false}
            .bind(to: isSearching)
            .disposed(by: disposeBag)
    }
}
