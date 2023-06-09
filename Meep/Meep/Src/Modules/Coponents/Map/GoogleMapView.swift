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
    
    private let infoWindow = Molecules.Views.markerInfoWindowView
    
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
        
        setupViews()
        
        addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupViews() {
        loadMapStyle()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        infoWindow.translatesAutoresizingMaskIntoConstraints = false
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
        let cameraPostion = GMSCameraPosition(target: lisbon, zoom: Float(Spacings.spacingM))
        mapView.animate(to: cameraPostion)
    }
    
    private func addMarkers() {
        markers.forEach { model in
            let position = CLLocationCoordinate2D(
                latitude: model.position.latitude,
                longitude: model.position.longitude)
            
            if mapView.projection.contains(position) {
                let marker = GMSMarker(position: position)
                let markerView = Molecules.Views.markerView
                
                markerView.translatesAutoresizingMaskIntoConstraints = false
                markerView.widthAnchor.constraint(equalToConstant: Spacings.spacingXl).isActive = true
                markerView.heightAnchor.constraint(equalToConstant: Spacings.spacingXl).isActive = true
                
                marker.userData = model
                marker.iconView = markerView
                markerView.binding(model: model.markerIcon)
                marker.map = mapView
            }
        }
    }
}

extension GoogleMapView: GMSMapViewDelegate {
    func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
        addMarkers()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        infoWindow.removeFromSuperview()
        addSubview(infoWindow)
        
        infoWindow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacings.spacingM).isActive = true
        infoWindow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacings.spacingM).isActive = true
        infoWindow.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        guard let model = marker.userData as? MarkerModel else { return false }
        infoWindow.binding(model: model.markerInfo, action: model.action)
        return false
    }
    
    
    // take care of the close event
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        infoWindow.removeFromSuperview()
    }
}
