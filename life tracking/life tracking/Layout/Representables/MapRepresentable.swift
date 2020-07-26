//
//  MapRepresentable.swift
//  life tracking
//
//  Created by Rodrigo Santos on 27/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import MapKit

struct MapRepresentable: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        
        @Binding var selectedPin: MapPin?
        @Binding var showingAlert: Bool
        
        init(selectedPin: Binding<MapPin?>, showingAlert: Binding<Bool>) {
            _selectedPin = selectedPin
            _showingAlert = showingAlert
        }
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            guard let annotation = annotation as? MapPin else { return nil }
            
            let identifier = "MapPin"
            var view: MKMarkerAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                view.markerTintColor = annotation.color
                view.glyphImage = UIImage(systemName: "waveform.path.ecg")
                view.animatesWhenAdded = true
            }
            return view
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            
            
            guard let pin = view.annotation as? MapPin else {
                return
            }
            
            pin.action?()
            guard case self.selectedPin = pin else { return }
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            
            guard (view.annotation as? MapPin) != nil else {
                return
            }
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            print("calloutAccessoryControlTapped")
            self.showingAlert = true
        }
    }
    
    @Binding var pins: [MapPin]
    @Binding var selectedPin: MapPin?
    @Binding var showingAlert: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedPin: $selectedPin, showingAlert: $showingAlert)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        //        uiView.showsUserLocation = true
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(pins)
        
        if let selectedPin = selectedPin {
            uiView.selectAnnotation(selectedPin, animated: true)
        }
        
    }
}


class MapPin: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let action: (() -> Void)?
    let color: UIColor?
    
    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         subtitle: String? = nil,
         action: (() -> Void)? = nil,
         color: UIColor? = nil
    ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.action = action
        self.color = color
    }
    
}
