//
//  ContentView.swift
//  ClassSample2
//
//  Created by work on 2022/01/17.
//

import SwiftUI

struct ContentView: View {
    let imageLoadr = ImageLoader()
    
    var body: some View {
        
        VStack {
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                Task {
                    await self.imageLoadr.searchImages(keyword: "ねこ")
                }
            }
            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
