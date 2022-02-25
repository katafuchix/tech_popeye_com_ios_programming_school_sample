//
//  Models.swift
//  ClassSample2
//
//  Created by work on 2022/01/17.
//

import Foundation

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

enum PixabayAPIError: Error {
    case serverError       // サーバーで発生したエラー
    case noData              // データがないエラー
}
