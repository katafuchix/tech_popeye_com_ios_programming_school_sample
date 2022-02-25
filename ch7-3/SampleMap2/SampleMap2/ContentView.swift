//
//  ContentView.swift
//  SampleMap2
//
//  Created by work on 2022/01/10.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    // JR吉祥寺駅周辺 500m
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.7023137,
                                       longitude: 139.5803228),
        latitudinalMeters: 500, longitudinalMeters: 500)

    @State var annotations = [
        // 吉祥寺ヨドバシ
        PinItem(coordinate:
                    CLLocationCoordinate2D(latitude: 35.7047018,
                                           longitude: 139.581544)),
        // 吉祥寺ヤマダ電機
        PinItem(coordinate:
                    CLLocationCoordinate2D(latitude: 35.7023873,
                                           longitude: 139.5808619))
        ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations, annotationContent:  { item in
            MapMarker(coordinate: item.coordinate)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
