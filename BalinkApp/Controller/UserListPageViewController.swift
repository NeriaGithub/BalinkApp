//
//  UserListPageViewController.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import UIKit

class UserListPageViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var userListTableView: UITableView!
    var tableController:TableController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableController = TableController(tableView: userListTableView)
        tableController?.delegate = self
        setUsersInTableView()
    }
    private func setUsersInTableView(){
        if CoreDataManager.shared.coreDataIsEmpty(){
            ConnectionManager().getRequest { [weak self]
                (result:Result<DataModel,APIError>) in
                guard let strongSelf = self else { return}
                switch result {
                case .success(let dataModel):
                    CoreDataManager.shared.create(usersModel: dataModel.data)
                    CoreDataManager.shared.read()
                    strongSelf.tableController?.tableView.reloadData()
                case.failure(.failed):
                    print("API Error")
                }
            }
        }else{
            CoreDataManager.shared.read()
            tableController?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.userEditPageSegue {
            if let destinationVC = segue.destination as? UserEditPageViewController {
                if let indexPath = userListTableView.indexPathForSelectedRow {
                    destinationVC.delegate = self
                    destinationVC.user = CoreDataManager.shared.users[indexPath.row]
                }
            }
        }
    }
}

//MARK: Table Controller Delegate method
extension UserListPageViewController:TableControllerDelegate{
    func didSelectRow(user: User) {
        performSegue(withIdentifier: Constants.userEditPageSegue, sender: self)
    }
}
//MARK: User Edit Page ViewController Delegate method
extension UserListPageViewController: UserEditPageViewControllerDelegate{
    func updateTable() {
        CoreDataManager.shared.read()
        tableController?.tableView.reloadData()
    }
    
    
}


