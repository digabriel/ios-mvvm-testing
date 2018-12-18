//
//  RepositoryViewModel.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

class RepositoryViewModel: ModelViewModel<Repository> {
    var url: URL? {
        return URL(string: model.url)
    }
    
    var name: String {
        return model.name
    }
}
