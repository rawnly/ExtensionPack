//
//  MapCell.swift
//  Vallelunga
//
//  Created by Federico Vitale on 01/11/2019.
//  Copyright © 2019 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapCell: ThemedTableCell {
    var location: CLLocationCoordinate2D! {
        didSet {
            setupMap()
        }
    }
    
    private let map = MKMapView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPin(title: String, subTitle: String, coords coordinates: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        pin.title = title
        pin.subtitle = subTitle
        
        map.addAnnotation(pin)
    }
    
    func addPin(title: String, coords coordinates: CLLocationCoordinate2D) {
        addPin(title: title, subTitle: "", coords: coordinates)
    }
    
    private func setupMap() {
        map
            .addToView(self)
            .fillSuperView()
        
        map.setCenter(location, animated: true)
        
        let region = MKCoordinateRegion(
            center: location,
            latitudinalMeters: CLLocationDistance(exactly: 1000)!,
            longitudinalMeters: CLLocationDistance(exactly: 1500)!
        )
        
        map.setRegion(map.regionThatFits(region), animated: true)
        
        map.isRotateEnabled = false
        map.isZoomEnabled = false
        map.isScrollEnabled = false
    }
}
