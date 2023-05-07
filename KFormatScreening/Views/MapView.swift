//
//  MapView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 5/7/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.057659613062725, longitude: -118.41576341652842),
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
