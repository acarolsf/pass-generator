//
//  SwitchComponent.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import UIKit

class SwitchComponent: UIView {

    init(titleLabel: String) {
        super.init(frame: .zero)
        title.text = titleLabel
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Components
    
//    private lazy var hStack: UIStackView = {
//        let view = UIStackView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .horizontal
//        view.spacing = 16
//        view.distribution = .fillProportionally
//        return view
//    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch(frame: .zero)
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }()
    
    // MARK: - Setup
    private func setupView() {
//        addSubview(hStack)
//        hStack.addArrangedSubview(title)
//        hStack.addArrangedSubview(switchView)
        addSubview(title)
        addSubview(switchView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            hStack.topAnchor.constraint(equalTo: topAnchor),
//            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
//            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1),
//            hStack.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            switchView.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            switchView.topAnchor.constraint(equalTo: topAnchor),
            switchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            switchView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
