//
//  StadiumListDelegate.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation
import UIKit

final class StadiumListViewDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: StadiumsListViewModel?
    
    init(viewModel: StadiumsListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel?.isSearching.value ?? false {
            if let selectedStadium = viewModel?.modelResults.value?.stadiums[indexPath.row] {
                viewModel?.selectedStadium.value = selectedStadium
            }
        } else {
            if let selectedStadium = viewModel?.model.value?.stadiums[indexPath.row] {
                viewModel?.selectedStadium.value = selectedStadium
            }
        }
    }
}
