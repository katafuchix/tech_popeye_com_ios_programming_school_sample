//
//  ImageLoader.swift
//  ClassSample2
//
//  Created by work on 2022/01/17.
//

import Foundation

class ImageLoader {
    
    // Pixabay API key
    let api_key = "xxxxxxxxxxxxxx"
    
    // 素材情報
    var imageDatas: [ImageData] = []
    
    init() {
        self.imageDatas = []
    }
    
    func searchImages(keyword: String) async throws {
        self.imageDatas = []
        
        let urlStr = "https://pixabay.com/api/?key=\(self.api_key)&q=\(keyword)"
        let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // ステータスコードが200でなければエラー
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw PixabayAPIError.serverError }
        
        // JSONを解析して作成した構造体の通りにマッピング
        guard let decoded = try? JSONDecoder().decode(SearchImageDataModel.self, from: data) else { throw PixabayAPIError.noData }
        
        self.imageDatas = decoded.hits
        for item in decoded.hits {
            print(item.id)
            print(item.largeImageURL)
            print("-------")
        }
    }
}
