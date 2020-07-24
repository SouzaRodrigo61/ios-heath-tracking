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

        init(selectedPin: Binding<MapPin?>) {
            _selectedPin = selectedPin
        }

        func mapView(_ mapView: MKMapView,
                     didSelect view: MKAnnotationView) {
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
    }

    @Binding var pins: [MapPin]
    @Binding var selectedPin: MapPin?

    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedPin: $selectedPin)
    }

    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        uiView.showsUserLocation = true
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

    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         subtitle: String? = nil,
         action: (() -> Void)? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }

}
