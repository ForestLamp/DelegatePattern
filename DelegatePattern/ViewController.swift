//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Alex on 24.11.2022.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func newTextForLabel(text: String)
}

class ViewController: UIViewController {
    
    //MARK: - UI elements
    
    private lazy var toSecondViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to second VC", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toSecondVCButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.text = "Standart text"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        makeConstraints()
    }
    
    //MARK: - Private methods
    
    private func makeConstraints() {
        
        view.addSubview(toSecondViewControllerButton)
        view.addSubview(someLabel)
        NSLayoutConstraint.activate([
            toSecondViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toSecondViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            someLabel.centerXAnchor.constraint(equalTo: toSecondViewControllerButton.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: toSecondViewControllerButton.centerYAnchor, constant: 40)
        ])
    }
    
    //MARK: - Actions
    
    @objc func toSecondVCButtonPressed() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        present(secondVC, animated: true)
    }
}

extension ViewController: SecondViewControllerDelegate {
    
    func newTextForLabel(text: String) {
        someLabel.text = text
    }
}
