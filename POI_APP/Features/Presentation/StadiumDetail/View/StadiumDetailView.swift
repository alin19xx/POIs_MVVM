//
//  StadiumDetailView.swift
//  POI_APP
//
//  Created by Alex Lin on 11/2/23.
//

import UIKit
import MapKit

class StadiumDetailView: UIViewController {
    
    var mainCoordinator: MainCoordinator?
    
    var model: StadiumModel?
    var stadiumLocation: CLLocation?
    
    private(set) var mapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if let name = model?.title {
            title = name
        }
        
        setupView()
        
    }
    
    private func setupView() {
        view.addSubview(mapView)
        
        setupConstraints()
    }
    
    func configureAnnotationWith(lat: String, long: String) {
        
        stadiumLocation = CLLocation(latitude: Double(lat) ?? 0,
                                     longitude: Double(long) ?? 0)
        
        guard let lat = stadiumLocation?.coordinate.latitude,
              let long = stadiumLocation?.coordinate.longitude else { return }
        
        let pin = MKPointAnnotation()
        pin.title = model?.title ?? ""
        pin.coordinate = CLLocationCoordinate2D(latitude: lat,
                                                longitude: long)
        
        mapView.addAnnotation(pin)
        mapView.setCenter(pin.coordinate, animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
