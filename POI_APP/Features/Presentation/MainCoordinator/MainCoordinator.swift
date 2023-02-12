//
//  MainCoordinator.swift
//  POI_APP
//
//  Created by Alex Lin on 11/2/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

final class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let home = StadiumListView()
        home.mainCoordinator = self
        
        self.navigationController.pushViewController(home, animated: true)
    }
    
    func dismissViewController() {
        self.navigationController.dismiss(animated: true)
    }
    
    func pushDetailStadiumViewController(model: StadiumModel) {
        let detailVC = StadiumDetailView()
        detailVC.model = model
        detailVC.mainCoordinator = self
        detailVC.configureAnnotationWith(lat: model.lat, long: model.long)
        
        self.navigationController.pushViewController(detailVC, animated: true)
    }
}
