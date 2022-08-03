//
//  PasswordManager.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import Foundation

class PasswordManager {
    var totalCharacteres: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useUpperCasedLetters: Bool
    var useSpecialChacaracters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%^&*()_-+=~`]]}[{';?/<>,"
    private let numbers = "0123456789"
    
    init(numberCaracters: Int, useLetters: Bool, useNumbers: Bool, useUpperCasedLetters: Bool, useSpecialChacaracters: Bool){
        
        var num = min(numberCaracters, 16)
        num = max(num, 1)
        
        self.totalCharacteres = num
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useUpperCasedLetters = useUpperCasedLetters
        self.useSpecialChacaracters = useSpecialChacaracters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters{
            universe += letters
        }
        
        if useNumbers{
            universe += numbers
        }
        
        if useSpecialChacaracters {
            universe += specialCharacters
        }
        
        if useUpperCasedLetters {
            universe += letters.uppercased()
        }
        
//        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
//            for i in 1...totalCharacteres {
//                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
//                password += String(universeArray[index])
//            }
            universe.forEach({ password += String($0) })
            
            passwords.append(password)
        }
        return passwords
    }
    
}
