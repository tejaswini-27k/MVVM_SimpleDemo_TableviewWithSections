//
//  FruitDetailsTableViewCell.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import UIKit

class FruitDetailsTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureData(_ fruitItem: FruitItem) {
        imgView.image = UIImage(named: fruitItem.image)
        lblTitle.text = fruitItem.title
    }
    
}
