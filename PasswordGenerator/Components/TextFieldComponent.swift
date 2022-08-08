//
//  TextFieldComponent.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 03/08/22.
//

import UIKit

class TextFieldComponent: UITextField {

    private struct Metrics {
        static let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Metrics.padding)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Metrics.padding)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Metrics.padding)
    }
}

// MARK: - Toolbar for Number Pads
extension UITextInput {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        
        var defaultAction: (target: Any, action: Selector)?  = nil
        
        if let input = self as? UIResponder {
            defaultAction = (target: input, action: #selector(UIResponder.resignFirstResponder))
        }
        
        let onCancel = onCancel ?? defaultAction
        let onDone = onDone ?? defaultAction
        
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: onCancel?.target, action: onCancel?.action)
        cancelButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .normal)
        
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: onDone?.target, action: onDone?.action)
        doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .normal)
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            cancelButton,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            doneButton
        ]
        
        toolbar.sizeToFit()
        
        if let textField = self as? UITextField {
            textField.inputAccessoryView = toolbar
        }
        if let textView = self as? UITextView {
            textView.inputAccessoryView = toolbar
        }
    }
}
