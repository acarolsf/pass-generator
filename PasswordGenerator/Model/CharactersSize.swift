//
//  CharactersSize.swift
//  PasswordGenerator
//
//  Created by Ana Carolina on 16/06/26.
//

enum CharactersSize: CaseIterable {
    case short
    case medium
    case large
    case superLarge
    
    var label : String {
        switch self {
            case .short: return LocalizationKeys.shortPassword.localized
            case .medium: return LocalizationKeys.mediumPassword.localized
            case .large: return LocalizationKeys.largePassword.localized
            case .superLarge: return LocalizationKeys.superLargePassword.localized
        }
    }
    
    var size: Int {
        switch self {
            case .short: return 6
            case .medium: return 8
            case .large: return 10
            case .superLarge: return 12
        }
    }
}
