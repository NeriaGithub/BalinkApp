//
//  UserModel.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation

//MARK: User Model
struct DataModel:Decodable {
    let data:[UserModel]
}

struct UserModel:Decodable {
    let id:Int
    let email:String
    let first_name:String
    let last_name:String
    let avatar:String
}
