//
//  ViewController.swift
//  SUCheckButton
//
//  Created by Su- on 11/13/2015.
//  Copyright (c) 2015 Su-. All rights reserved.
//

import UIKit
import SUCheckButton
class ViewController: UIViewController {

    @IBOutlet private weak var exampleView: UIView! {
        didSet {
            exampleView.clipsToBounds = true;
            exampleView.layer.cornerRadius = 8.0
        }
    }
    
    @IBOutlet private weak var checkButton: SUCheckButton! {
        didSet {
            checkButton.checkedFillColor = UIColor(red: 1.0, green: 0.2, blue: 0.1, alpha: 1.0)
            checkButton.didPressHandler = { [weak self] (checked: Bool) in
                self?.updateStatus()
            }
        }
    }
    
    @IBOutlet private weak var statusLabel: UILabel! {
        didSet {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateStatus() {
        let status = checkButton.isChecked ? "checked" : "unchecked"
        statusLabel.text = "status : " + status
    }

}

