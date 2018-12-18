//
//  UIResponser.swift
//  iOS-Sample
//
//  Created by Dimas on 18/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIResponder {
    var resignFirstResponder: AnyObserver<Void> {
        return Binder(self.base) { me, _ in
            me.resignFirstResponder()
        }.asObserver()
    }
}
