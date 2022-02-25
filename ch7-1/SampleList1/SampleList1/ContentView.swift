//
//  ContentView.swift
//  SampleList1
//
//  Created by Work on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("いぬ")
            Text("ねこ")
            Text("うざぎ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
