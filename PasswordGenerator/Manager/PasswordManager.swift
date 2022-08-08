//
//  PasswordManager.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import Foundation

class PasswordManager {
    var requirements: PasswordModel?
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%^&*()_-+=~`]]}[{';?/<>,"
    private let numbers = "0123456789"
    
    func getRequiredData(requirements: PasswordModel, completion: @escaping(Result<[String], Error>) -> Void) {
        var num = min(requirements.totalCharacteres, 16)
        num = max(num, 1)
        self.requirements = requirements
        self.requirements?.totalCharacteres = num
        
        generate(total: num, completion: completion)
    }
    
    func generate(total: Int, completion: @escaping(Result<[String], Error>) -> Void) {
        passwords.removeAll()
        guard let requirements = requirements else {
            completion(.failure(RequestErrors.noRequirement))
            return
        }

        var universe: String = ""
        
        if requirements.useLetters {
            universe += letters
        }
        
        if requirements.useNumbers {
            universe += numbers
        }
        
        if requirements.useSpecialChacaracters {
            universe += specialCharacters
        }
        
        if requirements.useUpperCasedLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...requirements.totalCharacteres {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        
        completion(.success(passwords))
    }
    
}

enum RequestErrors: Error {
    case noRequirement
}
