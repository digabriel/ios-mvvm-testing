//
//  SearchViewController.swift
//  iOS-Sample
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private let cellId = "cell"

class SearchViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    private let searchBar = UISearchBar(frame: .zero)
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        
        super.viewDidLoad()
    }
    
    override func setupBindings() {
        // Search text changed
        searchBar.rx.text.orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .skip(1) // Initial value
            .bind(to: viewModel.search)
            .disposed(by: disposeBag)
        
        // TableView Items
        viewModel.results.bind(to: tableView.rx.items(cellIdentifier: cellId)) {
            row, element, cell in
            cell.textLabel?.text = element.name
            cell.detailTextLabel?.text = element.url?.absoluteString ?? ""
        }
        .disposed(by: disposeBag)
        
        // Search bar cancel button show/hide
        Observable.merge(searchBar.rx.textDidBeginEditing.map {true},
                         searchBar.rx.textDidEndEditing.map {false})
            .bind(to: searchBar.rx.showsCancelButton)
            .disposed(by: disposeBag)
        
        // Search bar cancel button tap handler
        searchBar.rx
            .cancelButtonClicked
            .bind(to: searchBar.rx.resignFirstResponder)
        .disposed(by: disposeBag)
        
        viewModel.isSearching
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
