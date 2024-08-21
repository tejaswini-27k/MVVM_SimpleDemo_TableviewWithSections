//
//  FruitListViewController.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import UIKit

class FruitListViewController: UIViewController {
    
    @IBOutlet weak var fruitListTableview: UITableView!
    private var viewModel: FruitViewModelProtocol = FruitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.viewModel.delegate = self
        viewModel.loadFruitData()
    }
}

// MARK: SetupViews
extension FruitListViewController {
    private func setupTableView(){
        fruitListTableview.register(UINib(nibName: FruitListConstants.fruitDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: FruitListConstants.fruitDetailsTableViewCell)
    }
}

// MARK: - Tableview DataSource & Delegate
extension FruitListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FruitDetailsTableViewCell", for: indexPath) as? FruitDetailsTableViewCell {
            let fruitItem = viewModel.fruitItem(at: indexPath)
            cell.configureData(fruitItem)
            return cell
        }
        return UITableViewCell()
    }
}
// MARK: - FruitViewModelDelegate
extension FruitListViewController: FruitViewModelDelegate {
    func didFailWithError(_ message: String) {
        self.showAlert(title: "Alert", msg: message)
    }
}
