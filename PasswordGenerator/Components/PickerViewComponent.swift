//
//  PickerViewComponent.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import UIKit

class PickerViewComponent: UIView {
    
    private var fieldText: String = ""
    
    var pickerOptions: [String] = []

    var pickerDelegate: UIPickerViewDelegate? {
        didSet {
            self.field.delegate = pickerDelegate
        }
    }
    
    var pickerDataSource: UIPickerViewDataSource? {
        didSet {
            self.field.dataSource = pickerDataSource
        }
    }

    init(titleLabel: String) {
        super.init(frame: .zero)
        title.text = titleLabel
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Components
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var field: UIPickerView = {
        let textfield = UIPickerView(frame: .zero)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 4
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.masksToBounds = true
        return textfield
    }()
    
    // MARK: - Setup
    private func setupView() {
        addSubview(title)
        addSubview(field)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            field.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            field.leadingAnchor.constraint(equalTo: leadingAnchor),
            field.trailingAnchor.constraint(equalTo: trailingAnchor),
            field.bottomAnchor.constraint(equalTo: bottomAnchor),
            field.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Public functions
    func getFieldData() -> String? {
        return fieldText
    }
}

