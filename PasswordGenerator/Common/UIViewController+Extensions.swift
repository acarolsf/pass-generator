//
//  UIViewController+Extensions.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 03/08/22.
//

import UIKit

extension UIViewController {
    
    /// Show an alert dialog
    ///
    /// - Parameters:
    ///   - theTitle: Title from alert message
    ///   - theMessage: text message to appear
    ///   - action: here only OK option
    func showInfoAlert(theTitle: String = "Info", theMessage: String, action: (() -> Void)? = nil) {
        ensureMainThread {
            let alertViewControler = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
            alertViewControler.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in
                action?()
            }))
            self.present(alertViewControler, animated: true, completion: nil)
        }
    }
    
}
