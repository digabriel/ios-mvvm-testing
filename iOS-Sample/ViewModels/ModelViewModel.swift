//
//  BaseViewModel.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation

protocol ViewModelServices {
    associatedtype Services
    var services: Services? {get set}
}

class ModelViewModel<T> {
    var model: T
    
    init(model: T) {
        self.model = model
    }
}
