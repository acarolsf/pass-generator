//
//  HomeViewController.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var isLowLetter: Bool = false
    var isUpperLetter: Bool = false
    var isNumber: Bool = false
    var isCharacteres: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupComponents()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - Setup UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Password Generator"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberOfPasswordsView: TextFieldViewComponent = {
        let component = TextFieldViewComponent(titleLabel: "Número de senhas")
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    private lazy var totalOfCaracteresView: TextFieldViewComponent = {
        let component = TextFieldViewComponent(titleLabel: "Total de caracteres")
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    private lazy var lowLetterView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar letras minúsculas")
        component.translatesAutoresizingMaskIntoConstraints = false
        component.delegate = self
        component.switchTag = 0
        return component
    }()
    
    private lazy var upperLetterView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar letras MAIÚSCULA")
        component.translatesAutoresizingMaskIntoConstraints = false
        component.delegate = self
        component.switchTag = 1
        return component
    }()
    
    private lazy var useNumberView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar números")
        component.translatesAutoresizingMaskIntoConstraints = false
        component.delegate = self
        component.switchTag = 2
        return component
    }()
    
    private lazy var useSpecialCaracteresView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar caracteres especiais")
        component.translatesAutoresizingMaskIntoConstraints = false
        component.delegate = self
        component.switchTag = 3
        return component
    }()
    
    private lazy var generateButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Gerar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.masksToBounds = true
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(generateNewPasswords)))
        return button
    }()
    
    // MARK: - Setup Functions
    private func setupComponents() {
       
        [
            titleLabel,
            numberOfPasswordsView,
            totalOfCaracteresView,
            lowLetterView,
            upperLetterView,
            useNumberView,
            useSpecialCaracteresView,
            generateButton
        ].forEach({
            view.addSubview($0)
        })
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
                     
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            numberOfPasswordsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            numberOfPasswordsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberOfPasswordsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            totalOfCaracteresView.topAnchor.constraint(equalTo: numberOfPasswordsView.bottomAnchor, constant: 24),
            totalOfCaracteresView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            totalOfCaracteresView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            lowLetterView.topAnchor.constraint(equalTo: totalOfCaracteresView.bottomAnchor, constant: 24),
            lowLetterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lowLetterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            upperLetterView.topAnchor.constraint(equalTo: lowLetterView.bottomAnchor, constant: 24),
            upperLetterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            upperLetterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            useNumberView.topAnchor.constraint(equalTo: upperLetterView.bottomAnchor, constant: 24),
            useNumberView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            useNumberView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            useSpecialCaracteresView.topAnchor.constraint(equalTo: useNumberView.bottomAnchor, constant: 24),
            useSpecialCaracteresView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            useSpecialCaracteresView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            generateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            generateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            generateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            generateButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func generateNewPasswords() {
        guard let totalPss = Int(numberOfPasswordsView.getFieldData()!.digits), let totalCharacteres = Int(totalOfCaracteresView.getFieldData()!.digits) else { return }
        
        let viewController = ShowListPasswordsViewController()
        viewController.requirements = PasswordModel(numberOfPasswords: totalPss, totalCharacteres: totalCharacteres, useLetters: isLowLetter, useNumbers: isNumber, useUpperCasedLetters: isUpperLetter, useSpecialChacaracters: isCharacteres)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: SwitchViewDelegate {
    func switchUpdate(_ toogle: UISwitch) {
        switch toogle.tag {
        case 0:
            isLowLetter  = !isLowLetter
        case 1:
            isUpperLetter = !isUpperLetter
        case 2:
            isNumber = !isNumber
        case 3:
            isCharacteres = !isCharacteres
        default:
            break
        }
    }
    
}

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
