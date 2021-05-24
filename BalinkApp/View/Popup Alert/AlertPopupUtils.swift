//
//  AlertPopupUtils.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 01/02/2021.
//

import Foundation
import UIKit

class AlertPopupUtils{
    
    func showAlertPopup(payload:AlertPayload, parentViewController:UIViewController, height:CGFloat = 130, width:CGFloat = 270) {
        guard let popupAlertVC = self.instantiateViewController(storyboardName: Constants.storyboardAlertsName, viewControllerIdentifier: Constants.popupAlertViewControllerIdentifier) as? PopupAlertController else { return  }
        
        popupAlertVC.payload = payload
        
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alertController.setValue(popupAlertVC, forKey: "contentViewController")
        let heightConstraint = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        let widthConstraint = NSLayoutConstraint(item: alertController.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        alertController.view.addConstraint(heightConstraint)
        alertController.view.addConstraint(widthConstraint)
        parentViewController.present(alertController, animated: true, completion: nil)
    }
    
    private func instantiateViewController(storyboardName:String, viewControllerIdentifier:String)->UIViewController{
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
}
