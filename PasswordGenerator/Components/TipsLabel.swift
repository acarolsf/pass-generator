//
//  TipsLabel.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 09/08/22.
//

import Foundation
import UIKit

class TipsLabel: UIView {
    
    init(title: String, texto: String) {
        super.init(frame: .zero)
        tipTitle.text = title
        tipContent.text = texto
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tipTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#982465")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var tipContent: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#565656")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private func setupUI() {
        [
            tipTitle,
            tipContent
        ].forEach({
            addSubview($0)
        })
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tipTitle.topAnchor.constraint(equalTo: topAnchor),
            tipTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tipContent.topAnchor.constraint(equalTo: tipTitle.bottomAnchor, constant: 8),
            tipContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipContent.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

