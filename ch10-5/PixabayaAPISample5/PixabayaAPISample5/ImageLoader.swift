//
//  ImageLoader.swift
//  ClassSample2
//
//  Created by work on 2022/01/17.
//

import Foundation

import Foundation

class ImageLoader: ObservableObject {
    
    // Pixabay API key
    let api_key = "xxxxxxxxxxxxxx"
    
    // 素材情報
    @Published var imageDatas: [ImageData] = []
    
    init() {
        self.imageDatas = []
    }
    
    func searchImages(keyword: String) async throws {
        DispatchQueue.main.async {  // メインスレッドで処理
            self.imageDatas = []
        }
        let urlStr = "https://pixabay.com/api/?key=\(self.api_key)&q=\(keyword)"
        let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // ステータスコードが200でなければエラー
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw PixabayAPIError.serverError }
        
        // JSONを解析して作成した構造体の通りにマッピング
        guard let decoded = try? JSONDecoder().decode(SearchImageDataModel.self, from: data) else { throw PixabayAPIError.noData }

        DispatchQueue.main.async {  // メインスレッドで処理
            self.imageDatas = decoded.hits
        }
    }
}
