//
//  ContentView.swift
//  APISample1
//
//  Created by work on 2022/01/13.
//

import SwiftUI

struct ContentView: View {
    // Pixabay API key
    let api_key = "xxxxxxxxxxxxxx"
    
    var body: some View {
        VStack {
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                Task {
                    do {
                        let urlStr = "https://pixabay.com/api/?key=\(api_key)&q=ねこ"
                        let url = URL(string:urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
                        
                        let (data, response) = try await URLSession.shared.data(from: url)
                        
                        print(response)
                        print(data)
                        
                        print(String(data: data, encoding: .utf8)!)
                        
                    } catch {
                        print("エラー発生")
                        print(error)
                    }
                    
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

// hitsを格納する構造体
struct HitsModel:Codable{
    let total: Int
    let totalHits: Int
    let hits : [ImageData]
}

// ユーザー情報を格納す構造体
struct ImageData: Identifiable, Codable  {
    let id: Int
    let largeImageURL: String
}

// APIのエラー
enum ImageError: Error {
    case serverError
    case noData
}
