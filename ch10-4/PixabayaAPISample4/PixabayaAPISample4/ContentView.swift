//
//  ContentView.swift
//  PixabayaAPISample4
//
//  Created by work on 2022/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputText = ""
    @State var buttonEnabled = false
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            HStack {
                TextField("検索キーワード", text: $inputText)
                    .onChange(of: self.inputText) {
                        // 3文字以上でボタン押下可能
                        if ($0.count >= 3) {
                            self.buttonEnabled = true
                        } else {
                            self.buttonEnabled = false
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 32)
                    .padding([.leading, .trailing], 8)

                Button("検索") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                    Task {
                        do {
                            // 画像検索
                            try await self.imageLoader.searchImages(keyword: self.inputText)
                        } catch {
                            print(error)
                        }
                    }
   
                }.disabled(!self.buttonEnabled)
            }
            .frame(height: 64)
            .padding([.leading, .trailing], 16)
            
            ScrollView {
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
