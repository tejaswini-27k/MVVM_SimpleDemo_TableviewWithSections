//
//  FruitModel.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import Foundation

struct FruitModule: Decodable {
    let data: [FruitData]
    
    private enum CodingKeys: String, CodingKey {
           case data = "Data"
       }
}
    
struct FruitData: Decodable {
    let fruitImage: String
    let listData: [FruitItem]
}

struct FruitItem: Decodable {
    let image: String
    let title: String
}
