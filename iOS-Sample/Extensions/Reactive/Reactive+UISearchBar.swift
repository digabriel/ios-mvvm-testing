//
//  UISearchBar.swift
//  iOS-Sample
//
//  Created by Dimas on 18/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UISearchBar {
    var showsCancelButton: AnyObserver<Bool> {
        return Binder(self.base) { searchBar, showsCancelButton in
            searchBar.setShowsCancelButton(showsCancelButton, animated: true)
        }.asObserver()
    }
}
