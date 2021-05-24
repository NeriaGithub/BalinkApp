//
//  AlertManager.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 02/02/2021.
//

import Foundation
import UIKit
class AlertManager {
    
    //MARK: Properties
    static let shared = AlertManager()
    var messages:[Message] = []
    let utils = AlertPopupUtils()
    
    private init(){}
    
    //MARK: Alert Manager method
    func showAlert(parentViewController:UIViewController){
        guard messages.count > 0 else { return }
        let message = messages.first
        func removeAndShowNextMessage(){
            messages.removeFirst()
            showAlert(parentViewController: parentViewController)
        }
        let okButton = AlertButton(title: "OK", action: {
            print("OK Clicked")
            removeAndShowNextMessage()
        }, titleColor: nil, backgroundColor: nil)
        
        let cancelButton = AlertButton(title: "Cancel", action: {
            print("Cancel Clicked")
            removeAndShowNextMessage()
        }, titleColor: nil, backgroundColor: nil)
        let alertPayload = AlertPayload(title: message?.title, titleColor: nil, message: message?.message, messageColor:nil , buttons: [okButton,cancelButton], backgroundColor: nil)
        utils.showAlertPopup(payload: alertPayload, parentViewController: parentViewController)
    }

}
