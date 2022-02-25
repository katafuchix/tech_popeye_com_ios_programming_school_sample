//
//  ContentView.swift
//  Sample
//
//  Created by Word on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    var subject: String = "Hello, Swift"
    var message: String = "ボタンを押しました"
    
    var body: some View {
        VStack {
            Text(subject)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding()
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print(message)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
