//
//  ShowListPasswordsPresenter.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 03/08/22.
//

protocol ShowListPasswordsViewProtocol: AnyObject {
    func showPasswords()
    func showAlertError(message: String)
}

class ShowListPasswordsPresenter {
    
    weak var view: ShowListPasswordsViewProtocol?
    var passwordManager: PasswordManager
    
    var passwordsList: [String] = []
    
    init(view: ShowListPasswordsViewProtocol, passwordManager: PasswordManager = PasswordManager()) {
        self.view = view
        self.passwordManager = passwordManager
    }
    
    func getPasswords(required: PasswordModel) {
        self.passwordManager.getRequiredData(requirements: required) { result in
            switch result {
            case .success(let list):
                self.passwordsList = list
                self.view?.showPasswords()
            case .failure(let error):
                if error as! RequestErrors == RequestErrors.noRequirement {
                    self.view?.showAlertError(message: "Todos os campos precisam ser preenchidos!")
                }
            }
        }
    }
}
