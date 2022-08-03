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
