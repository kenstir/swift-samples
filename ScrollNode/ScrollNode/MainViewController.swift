//
//  MainViewController.swift
//  ScrollNode
//
//  Created by Ken Cox on 4/2/19.
//  Copyright © 2019 Ken Cox. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    //MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navigationItem.title = "xyzzy"
        button.tintColor = UIColor.darkGray
        button.layer.borderColor = button.currentTitleColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        print("xzxzxzxzxzxzxzxzxzxzxzx")
    }
}
