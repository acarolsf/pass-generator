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
    
    func showToast(message : String, font: UIFont = .systemFont(ofSize: 16)) {
        let center = CGRect(origin: CGPoint(x: self.view.frame.midX/4, y: self.view.frame.midY*1.6), size: CGSize(width: UIScreen.main.bounds.width*0.8, height: 48))
        let toastLabel = UILabel(frame: center)
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.lineBreakMode = .byWordWrapping
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
