//
//  UserCell.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import UIKit
import SwipeCellKit

class UserCell: SwipeTableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(user:User) {
        guard let firstName = user.first_name,
              let lastName = user.last_name,
              let email = user.email,
              let avatarString = user.avatar else {return}
        nameLabel.text = "\(firstName) \(lastName)"
        emailLabel.text = email
        avatarImageView.loadImage(stringURL: avatarString)
    }

    
    
}
