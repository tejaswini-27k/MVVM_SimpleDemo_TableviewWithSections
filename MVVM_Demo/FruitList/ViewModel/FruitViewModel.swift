//
//  FruitViewModel.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import Foundation

protocol FruitViewModelDelegate: AnyObject {
    func didFailWithError(_ message: String)
}

protocol FruitViewModelProtocol {
    var fruitData: [FruitData] { get }
    var delegate: FruitViewModelDelegate? { get set }
    func loadFruitData()
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func titleForHeader(in section: Int) -> String
    func fruitItem(at indexPath: IndexPath) -> FruitItem
}

class FruitViewModel : FruitViewModelProtocol  {
    var fruitData: [FruitData] = []
    weak var delegate: FruitViewModelDelegate?
    private var requestManager: JSONLoaderProtocol = FileReader()
    
    func loadFruitData() {
        do {
            self.fruitData = try requestManager.loadJSONData(fileName: "Data", fileType: "json", modelType: FruitModule.self).data
        } catch JSONLoadingError.fileNotFound {
            delegate?.didFailWithError("File not found.")
        } catch JSONLoadingError.decodingFailed(let error) {
            delegate?.didFailWithError("Decoding failed with error: \(error)")
        } catch {
            delegate?.didFailWithError("An unexpected error occurred: \(error)")
        }
    }
    
    func numberOfSections() -> Int {
        return fruitData.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return fruitData[section].listData.count
    }
    
    func titleForHeader(in section: Int) -> String {
        return fruitData[section].fruitImage
    }
    
    func fruitItem(at indexPath: IndexPath) -> FruitItem {
        return fruitData[indexPath.section].listData[indexPath.row]
    }
    
}
