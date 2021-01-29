//
//  CoreDataManager.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation
import CoreData

// MARK: Core Data Manager Singleton 
class CoreDataManager {
    //MARK: Properties
    static let shared = CoreDataManager()
    var users:[User] = []
    private init(){}
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.coreDataEntity)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext()  {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch  {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Core Data is empty method
    func coreDataIsEmpty() ->Bool{
        var isEmpty:Bool{
            do {
                let request:NSFetchRequest<User> = User.fetchRequest()
                let count = try persistentContainer.viewContext.count(for: request)
                return count == 0 ? true : false
                
            } catch  {
                print("error: \(error)")
                return true
            }
        }
        return isEmpty
    }
    
    // MARK: Core Data CRUD methods
    func create(usersModel:[UserModel])  {
        for userModel in usersModel {
            let user = User(context: persistentContainer.viewContext)
            user.id = Int16(userModel.id)
            user.first_name = userModel.first_name
            user.last_name = userModel.last_name
            user.email = userModel.email
            user.avatar = userModel.avatar
            //users.append(user)
        }
        do {
            try persistentContainer.viewContext.save()
            print("successful")
        } catch  {
            print("failed \(error)")
        }
    }
    
    func read()  {
        let request:NSFetchRequest<User> = User.fetchRequest()
        do {
            users = try persistentContainer.viewContext.fetch(request)
            print("successful")
        } catch  {
            print("failed \(error)")
        }
    }
    
    func update(id:Int16, firstName:String, lastName:String) {
        let request:NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "id = %d", id)
        do
             {
                let userList = try persistentContainer.viewContext.fetch(request)
                let userObject = userList[0]
                do{
                    userObject.first_name = firstName
                    userObject.last_name = lastName
                    try persistentContainer.viewContext.save()
                }catch{
                    print("failed \(error)")
                }
             }
        catch{
            print("failed \(error)")
        }
    }
    
    func delete(atRow row:Int) {
        let request:NSFetchRequest<User> = User.fetchRequest()
        do {
           let userList = try persistentContainer.viewContext.fetch(request)
            let objectToDelete = userList[row]
            persistentContainer.viewContext.delete(objectToDelete)
            do {
                try persistentContainer.viewContext.save()
            } catch  {
                print("failed \(error)")
            }
        } catch  {
            print("failed \(error)")
        }
    }
}
