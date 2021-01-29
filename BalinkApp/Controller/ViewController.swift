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
       
    }

    // MARK: IBActions
    @IBAction func showPopupPressed(_ sender: UIButton) {
        PopupManager.shared.buildPopup(popupType: .customPopup) { [weak self](popup) in
            guard let myPopup = popup,
                  let strongSelf = self else { return  }
            myPopup.delegate = self
            myPopup.popupConstraints(parentView: strongSelf.view)
        }
    }
    
    @IBAction func closePopupPressed(_ sender: UIButton) {
        PopupManager.shared.removePopup { [weak self](type) in
            guard let strongSelf = self else { return }
            for view in strongSelf.view.subviews{
                if let myPopup = view as? BasePopup {
                    if myPopup.popupType == PopupManager.shared.popupType {
                        myPopup.removeFromSuperview()
                    }
                }
            }
        }
    }
    
}
//MARK:Base Popup Delegate methods
extension ViewController:BasePopupDelegate{
    func didTapOK(callback: String) {
        print(callback)
    }
    
    func didTapCancel(callback: String) {
        print(callback)
    }
    
    
    
}

