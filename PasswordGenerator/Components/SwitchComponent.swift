//
//  SwitchComponent.swift
//  PasswordGenerator
//
//  Created by Ana Carolina Ferreira on 02/08/22.
//

import UIKit

protocol SwitchViewDelegate: AnyObject {
    func switchUpdate(_ toogle: UISwitch)
}

class SwitchComponent: UIView {
    
    var switchData: Bool = false
    
    weak var delegate: SwitchViewDelegate?
    
    var switchTag: Int? {
        didSet {
            self.switchView.tag = switchTag ?? 0
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch(frame: .zero)
        switchView.translatesAutoresizingMaskIntoConstraints = false
//        switchView.onTintColor = Colors.primary700
        switchView.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        switchView.addTarget(self, action: #selector(switchChanged(mySwitch:)), for: .valueChanged)
        switchView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        switchView.isOn = false
        return switchView
    }()
    
    // MARK: - Setup
    private func setupView() {
        addSubview(title)
        addSubview(switchView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
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
    
    @objc func switchChanged(mySwitch: UISwitch) {
        delegate?.switchUpdate(mySwitch)
    }
}
