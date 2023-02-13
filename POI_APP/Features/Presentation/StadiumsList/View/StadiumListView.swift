//
//  StadiumListView.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import UIKit

class StadiumListView: UIViewController, UISearchResultsUpdating {
    
    private enum Constants {
        static let searchPlaceholderText = "Search stadiums"
        static let navBarTitle = "Stadiums"
        static let pullToRefreshText = "Pull to refresh"
        static let errorTitle = "Ups"
        static let errorMessage = "Something went wrong :("
        static let alertButton = "Refresh"
    }
    
    var viewModel: StadiumsListViewModel = DefaultStadiumsListViewModel()
    var mainCoordinator: MainCoordinator?
    
    private(set) var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = Constants.searchPlaceholderText
        
        return controller
    }()
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var dataSource: StadiumListViewDataSource = {
        StadiumListViewDataSource(tableview: tableView,
                             viewModel: viewModel)
    }()
    
    private lazy var delegate: StadiumListViewDelegate = {
       StadiumListViewDelegate(viewModel: viewModel)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = Constants.navBarTitle
        
        setupView()
        setupBinding()
        
        viewModel.viewDidLoad()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        setupTableView()
        setupSearchController()
        
        setupConstraints()
    }
    
    private func setupTableView() {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Constants.pullToRefreshText)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        dataSource.registerCells()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    private func setupBinding() {
        viewModel.model.bind { [weak self] model in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.modelResults.bind { [weak self] model in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.selectedStadium.bind { [weak self] selectedModel in
            guard let self = self,
                  let selectedModel = selectedModel else { return }
            
            self.mainCoordinator?.pushDetailStadiumViewController(model: selectedModel)
        }
        
        viewModel.showErrorAlert.bind { [weak self] showError in
            guard let self = self,
                  let showError = showError, showError else { return }
            DispatchQueue.main.async {
                self.showErrorAlert()
            }
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        tableView.refreshControl?.endRefreshing()
        viewModel.viewDidLoad()
        
        tableView.reloadData()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Alert

extension StadiumListView {
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: Constants.errorTitle, message: Constants.errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Constants.alertButton, style: .cancel, handler: { _ in
            self.viewModel.viewDidLoad()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - UISearchResultsUpdating

extension StadiumListView {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.isSearching.value = searchController.isActive
        
        let searchText = (searchController.searchBar.text ?? "")
        viewModel.filterContentForSearchText(searchText)
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        viewModel.viewDidLoad()
    }
}
