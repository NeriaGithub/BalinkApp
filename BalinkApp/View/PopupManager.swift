//
//  PopupManager.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 28/01/2021.
//

import Foundation
import UIKit

// MARK: Popup type
enum PopupType {
    case customPopup
    case none
}

// MARK: Popup Manager Singleton
class PopupManager {
    static let shared = PopupManager()
    private init(){}
    
    // MARK:Properties
    var popupType:PopupType = .none
  
    // MARK:Popup Manager methods
    func buildPopup(popupType:PopupType, completion:(BasePopup?)->())  {
        var popup:BasePopup?
        self.popupType = popupType
        switch popupType {
        case .customPopup:
            popup = CustomPopup()
        case .none:
            break
        }
        completion(popup)
    }
    
    func isPresentedPopup()->Bool {
        return popupType == .none ? false : true
    }
    
    func removePopup(completion:(PopupType)->())  {
        completion(popupType)
    }
    
}










