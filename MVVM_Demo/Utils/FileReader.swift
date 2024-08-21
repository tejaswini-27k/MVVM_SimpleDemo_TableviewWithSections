//
//  FileReader.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import Foundation

enum JSONLoadingError: Error {
    case fileNotFound
    case decodingFailed(Error)
}

protocol JSONLoaderProtocol {
    func loadJSONData<T: Decodable>(fileName: String, fileType: String, modelType: T.Type) throws -> T
}

final class FileReader :JSONLoaderProtocol {
    func loadJSONData<T: Decodable>(fileName: String, fileType: String, modelType: T.Type) throws -> T {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            throw JSONLoadingError.fileNotFound
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw JSONLoadingError.decodingFailed(error)
        }
    }
}

