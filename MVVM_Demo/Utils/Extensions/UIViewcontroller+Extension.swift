//
//  UIViewcontroller+Extension.swift
//  MVVM_Demo
//
//  Created by Neosoft on 21/08/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, msg: String, _ completion : (() -> Void)? = nil) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { _ in
            alertView.dismiss(animated: true, completion: nil)
            completion?()
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
}
