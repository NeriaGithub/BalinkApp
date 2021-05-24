//
//  AlertPayload.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 01/02/2021.
//

import UIKit

struct AlertPayload {
    var title:String!
    var titleColor:UIColor?
    var message:String!
    var messageColor:UIColor?
    var buttons:[AlertButton]!
    var backgroundColor:UIColor?
}
