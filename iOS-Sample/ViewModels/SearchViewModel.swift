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
    
    private let disposeBag = DisposeBag()
    
    init() {
        let searchPS = PublishSubject<String>()
        self.search = searchPS.asObserver()
        searchPS.subscribe(onNext: {
            str in
            print("Search for: \(str)")
        })
        .disposed(by: disposeBag)
    }
}

