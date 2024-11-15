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
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.7617,
                                       longitude: 80.1918), span: MKCoordinateSpan(
                                        latitudeDelta: 0.3, longitudeDelta: 0.3)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [data]) {coordinate in
            MapMarker(coordinate: coordinate.locationCoordinate)
        }.onAppear {
            region.center = data.locationCoordinate
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(data: landmarks[1])
    }
}
