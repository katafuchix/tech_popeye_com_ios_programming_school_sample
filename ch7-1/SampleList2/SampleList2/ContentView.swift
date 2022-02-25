//
//  ContentView.swift
//  SampleList2
//
//  Created by Work on 2022/01/10.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var title: String
}

struct ContentView: View {
    
    let items = [Item(title: "いぬ"),
                 Item(title: "ねこ"),
                 Item(title: "うさぎ")]
    
    var body: some View {
        List(self.items) { item in
            Text(item.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
