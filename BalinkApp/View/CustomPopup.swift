//
//  CustomPopup.swift
//  MyCustomView
//
//  Created by Neria Jerafi on 28/01/2021.
//

import UIKit



class CustomPopup: BasePopup {
//MARK:
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    //MARK: Setup method
    private func commonInit(){
        Bundle.main.loadNibNamed(Constants.customPopupName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        popupType = .customPopup
    }
    
    //MARK: BActions methods
    @IBAction func okButtonPressed(_ sender: UIButton) {
        delegate?.didTapOK(callback: "OK Button Callback")
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        delegate?.didTapCancel(callback: "Cancel Button Callback")
    }
}
