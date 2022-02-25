//
//  ImageLoader.swift
//  ClassSample2
//
//  Created by work on 2022/01/17.
//

import Foundation

class ImageLoader {
    
    // Pixabay API key
    //let api_key = "xxxxxxxxxxxxxx"
    let api_key = "25047768-6dd18cd23194a29968caff6dc"
    
    // 素材情報
    var imageDatas: [ImageData] = []
    
    init() {
        self.imageDatas = []
    }

    func searchImages(keyword: String) async {
        self.imageDatas = []
        
        do {
            let urlStr = "https://pixabay.com/api/?key=\(self.api_key)&q=\(keyword)"
            let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            print(response)
            print(data)
            
            print(String(data: data, encoding: .utf8)!)
            
            if let decoded = try? JSONDecoder().decode(SearchImageDataModel.self, from: data) {
                self.imageDatas = decoded.hits
                
                for item in self.imageDatas {
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
