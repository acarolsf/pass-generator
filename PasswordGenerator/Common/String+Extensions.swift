//
//  String+Extensions.swift
//  PasswordGenerator
//
//  Created by Ana Carolina on 15/06/26.
//

import Foundation

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
