//
//  ContentView.swift
//  PixabayaAPISample2
//
//  Created by work on 2022/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var inputText = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                TextField("検索キーワード", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 32)
                    .padding([.leading, .trailing], 8)
                Button("検索") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
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
