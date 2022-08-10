//
//  TipsViewController.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 10/08/22.
//

import Foundation
import UIKit

class TipsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ensureMainThread {
            self.title = "Dicas de segurança"
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha uma senha segura"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(hex: "#982465")
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    lazy var tipOne: TipsLabel = {
        let label = TipsLabel(title: "1. Escolha senhas fáceis de lembrar.", texto: "Escolher senhas fáceis de lembrar evita que o usuário tenha que anotá-la em papéis e/ou arquivos, que podem chegar às mãos de pessoas erradas")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipTwo: TipsLabel = {
        let label = TipsLabel(title: "2. Não use palavras reais.", texto: "Uma palavra que pode ser encontrada no dicionário pode facilitar o trabalho de invasores. Para tornar esse trabalho mais difícil, use frases ao invés de substantivos")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipThree: TipsLabel = {
        let label = TipsLabel(title: "3. Combine maiúsculas, minúsculas, números e caracteres não alfanuméricos", texto: "Uma palavra que pode ser encontrada no dicionário pode facilitar o trabalho de invasores. Para tornar esse trabalho mais difícil, use frases ao invés de substantivos")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipFour: TipsLabel = {
        let label = TipsLabel(title: "4. Não recicle senhas", texto: "Por exemplo, não use “senha1” , “senha321” ou qualquer senha semelhante. Escolha senhas aleatórias.")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [
            pageTitle,
            tipOne,
            tipTwo,
            tipThree,
            tipFour
        ].forEach({ stackView.addArrangedSubview($0) })
        setupConstraints()
    }
    
    func setupConstraints() {
        let mainViewHeightConstraint = stackView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
                
        mainViewHeightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainViewHeightConstraint,
        ])
    }
}
