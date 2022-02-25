//
//  ContentView.swift
//  SamplePicker1
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
    
    @State private var selection: Int = 0
    @State private var selectTitle: String = ""
    
    var body: some View {
        VStack {
            Picker(selection: $selection, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                ForEach(0..<self.items.count) { index in
                    Text(self.items[index].title).tag(index)
                }
            }.onChange(of: selection) {
                self.selectTitle = self.items[$0].title
            }
            Text(self.selectTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
