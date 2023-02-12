//
//  StadiumListDataSource.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation
import UIKit

final class StadiumListViewDataSource: NSObject, UITableViewDataSource {
    
    private let tableview: UITableView
    private var viewModel: StadiumsListViewModel?
    
    init(tableview: UITableView, viewModel: StadiumsListViewModel) {
        self.tableview = tableview
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableview.register(cellType: StadiumTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel?.isSearching.value ?? false {
            return viewModel?.modelResults.value?.stadiums.count ?? 0
        } else {
            return viewModel?.model.value?.stadiums.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let stadiumList = viewModel?.isSearching.value ?? false ? viewModel?.modelResults.value : viewModel?.model.value
        
        if let stadium = stadiumList?.stadiums[indexPath.row] as? StadiumModel {
            let cell: StadiumTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let model = StadiumTableViewCellModel(image: stadium.image, name: stadium.title)
            cell.configureWith(model: model)
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
}
