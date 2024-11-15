//
//  MapView.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var data: LandmarkModel
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: data.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)))) {
                Marker(data.name, coordinate: data.locationCoordinate)
            }
        } else {
            UIKitMapView(region: $region)
                .frame(height: 300).onAppear {
                    region = MKCoordinateRegion(center: data.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
                }
        }
    }
}

struct UIKitMapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
    }
}

#Preview {
    let viewModel = LandmarkVM()
    
    MapView(data: viewModel.landmarks[1])
}
