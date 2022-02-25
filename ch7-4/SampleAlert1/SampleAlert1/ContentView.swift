//
//  ContentView.swift
//  SampleAlert1
//
//  Created by work on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
    @State private var presentAlert: Bool = false
    
    var body: some View {
        Button("Alert") {
            presentAlert = true
        }
        .alert("アラート", isPresented: $presentAlert, actions: {
                // 処理
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
