//
//  SavePasswordViewController.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 08/08/22.
//

import Foundation
import UIKit

class SavePasswordViewController: UIViewController {
    
    var secret: String? {
        didSet {
            self.secretLabel.text = secret
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Salvar senha"
        setupUI()
    }
    
    private lazy var secretView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(copySecret)))
        return view
    }()
    
    private lazy var secretLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#982465")
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "copy")
        return imageView
    }()
    
    private lazy var descriptionTextFieldView: TextFieldViewComponent = {
        let textField = TextFieldViewComponent(titleLabel: "Descrição")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(Constants.shared.save, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(hex: "#982465")
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        [
            secretView,
            descriptionTextFieldView,
            saveButton
        ].forEach({
            view.addSubview($0)
        })
        
        secretView.addSubview(secretLabel)
        secretView.addSubview(iconView)
        
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            secretView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            secretView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secretView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            descriptionTextFieldView.topAnchor.constraint(equalTo: secretView.bottomAnchor, constant: 24),
            descriptionTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            secretLabel.topAnchor.constraint(equalTo: secretView.topAnchor, constant: 8),
            secretLabel.bottomAnchor.constraint(equalTo: secretView.bottomAnchor, constant: -8),
            secretLabel.centerXAnchor.constraint(equalTo: secretView.centerXAnchor),
            secretLabel.centerYAnchor.constraint(equalTo: secretView.centerYAnchor),
            
            iconView.topAnchor.constraint(equalTo: secretView.topAnchor, constant: 8),
            iconView.bottomAnchor.constraint(equalTo: secretView.bottomAnchor, constant: -8),
            iconView.trailingAnchor.constraint(equalTo: secretView.trailingAnchor, constant: -16),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24),
            
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    @objc private func copySecret() {
        UIPasteboard.general.string = secret
        self.showToast(message: "Senha copiada com sucesso!", font: .systemFont(ofSize: 16))
    }
}
