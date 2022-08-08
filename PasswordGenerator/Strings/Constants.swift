//
//  Constants.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 04/08/22.
//

import Foundation

class Constants {
    
    static let shared = Constants()
    
    let appName = NSLocalizedString("Gerador de senhas", comment: "")
    let numberOfPasswords = NSLocalizedString("Número de senhas", comment: "")
    let totalOfCharacteres = NSLocalizedString("Total de caracteres", comment: "")
    let lowercasedLetters = NSLocalizedString("Usar letras minúsculas", comment: "")
    let uppercasedLetters = NSLocalizedString("Usar letras MAIÚSCULA", comment: "")
    let useNumbers = NSLocalizedString("Usar números", comment: "")
    let useSpecialCharacteres = NSLocalizedString("Usar caracteres especiais", comment: "")
    let generate = NSLocalizedString("Gerar", comment: "")
    let allFieldsHasToBeFilled = NSLocalizedString("Todos os campos precisam ser preenchidos!", comment: "")
    let listOfPasswords = NSLocalizedString("Lista de senhas", comment: "")
    let generateNewPasswords = NSLocalizedString("Gerar novas senhas", comment: "")
    let securityTips = NSLocalizedString("Dicas de segurança", comment: "")
    let save = NSLocalizedString("Salvar", comment: "")
    
    // MARK: - Size of the passwords
    
    let shortPassword = NSLocalizedString("Pequena - 6 dígitos", comment: "")
    let mediumPassword = NSLocalizedString("Média - 8 dígitos", comment: "")
    let largePassword = NSLocalizedString("Grande - 10 dígitos", comment: "")
    let superLargePassword = NSLocalizedString("Muito grande - 12 dígitos", comment: "")
}
