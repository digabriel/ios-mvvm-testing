//
//  BaseViewController.swift
//  iOS-Sample
//
//  Created by Dimas on 18/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }
    
    func setupBindings() {
        
    }

}
