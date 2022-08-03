//
//  HomeViewController.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import UIKit

class HomeViewController: UIViewController {

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
        return component
    }()
    
    private lazy var upperLetterView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar letras MAIÚSCULA")
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    private lazy var useNumberView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar números")
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    private lazy var useSpecialCaracteresView: SwitchComponent = {
        let component = SwitchComponent(titleLabel: "Usar caracteres especiais")
        component.translatesAutoresizingMaskIntoConstraints = false
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
}

