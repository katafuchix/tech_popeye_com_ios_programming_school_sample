//
//  ContentView.swift
//  SampleAlert4
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
        .alert("アラート", isPresented: $presentAlert,
            actions: {
                Button("Button1", action: { print("button1") })
                Button("Button2", action: { print("button2") })
                Button("Button3", action: { print("button3") })
                Button("Button4", action: { print("button4") })
            },
            message: {
                Text("Message")
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
