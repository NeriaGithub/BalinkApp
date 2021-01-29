//
//  BasePopup.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 28/01/2021.
//

import UIKit

// MARK: Base Popup Delegate
protocol BasePopupDelegate:class {
    func didTapOK(callback:String)
    func didTapCancel(callback:String)
}

class BasePopup: UIView {
    
    // MARK:Properties
    var popupType:PopupType = .none
    weak var delegate:BasePopupDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func popupConstraints(parentView:UIView) {
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: 200).isActive = true
        heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}



