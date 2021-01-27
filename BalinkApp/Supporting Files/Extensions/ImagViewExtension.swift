//
//  ImagViewExtension.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation
import UIKit

// MARK: Image View extension
extension UIImageView {
    func loadImage(stringURL: String) {
        guard let url = URL(string: stringURL) else { return}
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return}
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        strongSelf.image = image
                    }
                }
            }
        }
    }
}
