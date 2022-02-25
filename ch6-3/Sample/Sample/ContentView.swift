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
    
    @State var inputText: String = ""
    
    @State private var buttonEnabled: Bool = false
    
    var body: some View {
        VStack {
            TextField("入力してください", text: $inputText)
            .font(.title)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onChange(of: self.inputText) {
                // 5文字以上でボタン押下可能
                if ($0.count >= 5) {
                    self.buttonEnabled = true
                } else {
                    self.buttonEnabled = false
                }
            }
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print(self.inputText)
            }
            .disabled(!self.buttonEnabled)
            Text(self.inputText)
            .font(.title)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
