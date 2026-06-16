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
            self.title = LocalizationKeys.securityTips.localized
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
        label.text = LocalizationKeys.chooseSafePassword.localized
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
        let label = TipsLabel(title: LocalizationKeys.tipOneTitle.localized, texto: LocalizationKeys.tipOneText.localized)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipTwo: TipsLabel = {
        let label = TipsLabel(title: LocalizationKeys.tipTwoTitle.localized, texto: LocalizationKeys.tipTwoText.localized)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipThree: TipsLabel = {
        let label = TipsLabel(title: LocalizationKeys.tipThreeTitle.localized, texto: LocalizationKeys.tipThreeText.localized)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tipFour: TipsLabel = {
        let label = TipsLabel(title: LocalizationKeys.tipFourTitle.localized, texto: LocalizationKeys.tipFourText.localized)
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
