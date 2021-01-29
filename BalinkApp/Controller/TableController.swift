//
//  TableController.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation
import UIKit
import SwipeCellKit


// MARK: Table Controller delegate

protocol TableControllerDelegate:class {
    func didSelectRow(user:User)
}

class TableController: NSObject {
    // MARK: Properties
    var tableView:UITableView
    weak var delegate:TableControllerDelegate?
    init(tableView:UITableView) {
        self.tableView = tableView
        super.init()
        setup()
    }

    private func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: Table View Data Source methods

extension TableController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! UserCell
        cell.setCell(user: CoreDataManager.shared.users[indexPath.row])
        cell.delegate = self
        return cell
    }
    
}
// MARK: Table View Delegate method
extension TableController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(user: CoreDataManager.shared.users[indexPath.row])
    }
}

// MARK: Swipe Table View Cell Delegate method
extension TableController:SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else {return nil}
        let deleteAction = SwipeAction(style: .destructive, title: Constants.deleteCellActionTitle) { (action, indexPath) in
            CoreDataManager.shared.delete(atRow: indexPath.row)
            CoreDataManager.shared.read()
            tableView.reloadData()
        }
        deleteAction.image = UIImage(named: "delete-icon")
        return [deleteAction]

    }
    
}

