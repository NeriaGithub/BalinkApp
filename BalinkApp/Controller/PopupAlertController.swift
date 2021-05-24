//
//  PopupAlertController.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 01/02/2021.
//

import UIKit

class PopupAlertController: UIViewController {
    // MARK: Properties
   var payload:AlertPayload!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
        
    }
    
    private func setup(){
        titleLabel.text = payload.title
        messageLabel.text = payload.message
        createButton(uiButton: okButton, alertButton: payload.buttons[0])
        createButton(uiButton: cancelButton, alertButton: payload.buttons[1])

        if payload.backgroundColor != nil {
            view.backgroundColor = payload.backgroundColor
        }
    }
    
    // MARK: Create Custom popup alert buttons
    private func createButton(uiButton:UIButton, alertButton:AlertButton) {
        uiButton.setTitle(alertButton.title, for: .normal)
        
        if alertButton.titleColor != nil {
            uiButton.setTitleColor(alertButton.titleColor, for: .normal)
        }
        if alertButton.backgroundColor != nil {
            uiButton.backgroundColor = alertButton.backgroundColor
        }
    }
    
    // MARK: IBActions
    @IBAction func okButtonPressed(_ sender: UIButton) {
        parent?.dismiss(animated: false, completion: nil)
        payload.buttons.first?.action?()
    }
   
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        parent?.dismiss(animated: false, completion: nil)
        payload.buttons[1].action?()
    }
    
    
}

