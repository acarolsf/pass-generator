//
//  ShowListPasswordsViewController.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 03/08/22.
//

import UIKit

class ShowListPasswordsViewController: UIViewController {
    
    var requirements: PasswordModel?
    
    private lazy var presenter = ShowListPasswordsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let requirements = requirements {
            presenter.getPasswords(required: requirements)
        } else { showAlertError(message: Constants.shared.allFieldsHasToBeFilled) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = Constants.shared.listOfPasswords
        DispatchQueue.main.async {
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    // MARK: UI Components
    
    private lazy var uiTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PasswordTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var newPasswords: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(Constants.shared.generateNewPasswords, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var tips: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(Constants.shared.securityTips, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(uiTableView)
        view.addSubview(newPasswords)
        view.addSubview(tips)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            uiTableView.topAnchor.constraint(equalTo: view.topAnchor),
            uiTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            newPasswords.topAnchor.constraint(equalTo: uiTableView.bottomAnchor, constant: 16),
            newPasswords.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newPasswords.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newPasswords.heightAnchor.constraint(equalToConstant: 48),
            
            tips.topAnchor.constraint(equalTo: newPasswords.bottomAnchor, constant: 16),
            tips.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tips.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tips.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            tips.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func backScreen() {
        navigationController?.popViewController(animated: true)
    }
}

extension ShowListPasswordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.passwordsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PasswordTableViewCell else { return UITableViewCell() }
        cell.labelText = presenter.passwordsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = presenter.passwordsList[indexPath.row]
        UIPasteboard.general.string = cell
    }
    
}

extension ShowListPasswordsViewController: ShowListPasswordsViewProtocol {
    func showPasswords() {
        ensureMainThread {
            self.uiTableView.reloadData()
        }
    }
    
    func showAlertError(message: String) {
        ensureMainThread {
            self.backScreen()
            self.showAlertError(message: message)
        }
    }
    
    
}
