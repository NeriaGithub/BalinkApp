//
//  ViewController.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AlertManager.shared.messages.append(Message(title: "First Title", message: "First Message"))
        AlertManager.shared.messages.append(Message(title: "Second Title", message: "Second Message"))
        AlertManager.shared.messages.append(Message(title: "Third Title", message: "Third Message"))
    }
    
    // MARK: IBActions
    @IBAction func showPopupAlert(_ sender: UIButton) {
        AlertManager.shared.showAlert(parentViewController: self)
        
    }
    

    
}


