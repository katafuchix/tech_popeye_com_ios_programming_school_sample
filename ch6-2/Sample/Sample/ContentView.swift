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
    
    @State var inputText: String = "テキスト入力です"
    
    var body: some View {
        VStack {
            TextField("入力してください", text: $inputText)
            .font(.title)
            .textFieldStyle(.roundedBorder)
            .padding()
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print(self.inputText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
