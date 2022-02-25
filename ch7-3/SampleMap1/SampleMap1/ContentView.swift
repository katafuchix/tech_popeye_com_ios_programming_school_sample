//
//  ContentView.swift
//  SampleMap1
//
//  Created by work on 2022/01/10.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // JR吉祥寺駅周辺 500m
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.7023137,
                                       longitude: 139.5803228),
        latitudinalMeters: 500,
        longitudinalMeters: 500)

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
