//
//  UserEditPageViewController.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import UIKit

//MARK: User Edit Page ViewController Delegate
protocol UserEditPageViewControllerDelegate:class {
    func updateTable()
}

class UserEditPageViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    var user:User?
    weak var delegate: UserEditPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        firstNameTextField.text = user?.first_name
        lastNameTextField.text = user?.last_name
        self.title = "\(user?.first_name ?? "") \(user?.last_name ?? "")"
    }
    
// MARK: IBActions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let firstName = firstNameTextField.text , !firstName.isEmpty,
              let lastName = lastNameTextField.text , !lastName.isEmpty,
              let userId = user?.id else {return}
        CoreDataManager.shared.update(id: userId, firstName: firstName, lastName: lastName)
        delegate?.updateTable()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
