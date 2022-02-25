//
//  ContentView.swift
//  APISample2
//
//  Created by work on 2022/01/15.
//

import SwiftUI

// JSON全体を格納する構造体
struct SearchImageDataModel:Codable{
    let total: Int
    let totalHits: Int
    let hits : [ImageData]
}

// 素材情報を格納す構造体
struct ImageData: Identifiable, Codable  {
    let id: Int
    let largeImageURL: String
}


struct ContentView: View {
    // Pixabay API key
    //let api_key = "xxxxxxxxxxxxxx"
    let api_key = "25047768-6dd18cd23194a29968caff6dc"
    
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
                        
                        if let decoded = try? JSONDecoder().decode(SearchImageDataModel.self, from: data) {
                            print(decoded)
                            
                            for item in decoded.hits {
                                print(item.id)
                                print(item.largeImageURL)
                                print("-------")
                            }
                        }
                        
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

