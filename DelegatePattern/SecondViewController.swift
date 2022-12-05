//
//  SecondViewController.swift
//  DelegatePattern
//
//  Created by Alex on 24.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
    }
    
    deinit {
        self.delegate?.newTextForLabel(text: "New text")
    }
}
