//
//  StadiumsListViewModel.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation
import UIKit


protocol StadiumsListViewModelInput {
    func viewDidLoad()
}

protocol StadiumsListViewModelOuput {
    var model: Box<StadiumListModel?> { get }
    var modelResults: Box<StadiumListModel?> { get }
    var isSearching: Box<Bool> { get }
    var stadiumsUseCase: StadiumsUseCase? { get }
    var selectedStadium: Box<StadiumModel?> { get }
    
    func filterContentForSearchText(_ searchText: String)
}

protocol StadiumsListViewModel: StadiumsListViewModelInput, StadiumsListViewModelOuput {}

final class DefaultStadiumsListViewModel: StadiumsListViewModel {
    
    var model: Box<StadiumListModel?> = Box(nil)
    var modelResults: Box<StadiumListModel?> = Box(nil)
    var isSearching: Box<Bool> = Box(false)
    var selectedStadium: Box<StadiumModel?> = Box(nil)
    var stadiumsUseCase: StadiumsUseCase?
    
    init(stadiumsUseCase: StadiumsUseCase = DefaultStadiumsUseCase()) {
        self.stadiumsUseCase = stadiumsUseCase
    }
    
    func viewDidLoad() {
        model.value = nil
        modelResults.value = nil
        self.fetchStadiums()
    }
    
    private func fetchStadiums() {
        stadiumsUseCase?.fetchStadiums(completion: { result in
            switch result {
            case .success(let entity):
                self.model.value = StadiumListModel(entity: entity)
            case .failure(let error):
                break
            }
        })
    }
    
    func filterContentForSearchText(_ searchText: String) {
        var stadiumFilteredList = model.value?.stadiums.filter({ $0.title.contains(searchText) })
        
        modelResults.value = StadiumListModel(models: stadiumFilteredList ?? [])
    }
}
