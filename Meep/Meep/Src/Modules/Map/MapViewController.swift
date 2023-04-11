//
//  MapViewController.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit
import GoogleMaps

final class GoogleMapView: UIView {
    
    private var mapView = GMSMapView(frame: .zero)
    private var markers = [MarkerModel]()
    private var cameraPosition = PositionModel.empty
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraints()
        mapView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binding(model: MapModel) {
        markers = model.markers
        setCameraPosition(position: model.cameraPosition)
    }
    
    func configureConstraints() {
        
        setup()
        
        addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setup() {
        loadMapStyle()
        mapView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func loadMapStyle() {
        do {
            guard let styleURL = Bundle.main.styleURL else { return }
            mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
        } catch {
            NSLog("\(Strings.jsonError) \(error)")
        }
    }
    
    private func setCameraPosition(position: PositionModel) {
        let lisbon = CLLocationCoordinate2D(latitude: position.latitude, longitude: position.longitude)
        let cameraPostion = GMSCameraPosition(target: lisbon, zoom: 16)
        mapView.animate(to: cameraPostion)
    }
  
    private func addMarkers() {
        markers.forEach { model in
            let position = CLLocationCoordinate2D(
                latitude: model.position.latitude,
                longitude: model.position.longitude)
            
            if mapView.projection.contains(position) {
                let marker = GMSMarker(position: position)
                marker.iconView = model.markerIcon
                marker.title = model.markerTitle
                marker.snippet = model.name
                marker.map = mapView
            }
        }
    }
}

extension GoogleMapView: GMSMapViewDelegate {
    func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
        addMarkers()
    }
}
