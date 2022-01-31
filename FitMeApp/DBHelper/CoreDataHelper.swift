//
//  CoreDataHelper.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
import UIKit
import CoreData
import Foundation

@objc class CoreDataHelper : NSObject {
    
    var context: NSManagedObjectContext
    static let shared = CoreDataHelper()

    private override init(){
        self.context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: DBModelName)
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
}

extension CoreDataHelper {
    
    func insertRecord<T:NSManagedObject>(entity:T.Type, entityName:String, completion:(NSManagedObject, NSManagedObjectContext)->()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        //Create new Object of entity
        let entityObj = NSEntityDescription.insertNewObject(forEntityName: entityName,into: managedObjectContext)//entity(forEntityName: entityName, in: managedObjectContext)!  as! StepsTarget //
        completion(entityObj, managedObjectContext)
    }
}

extension CoreDataHelper {
    func fetchRecord<T:NSManagedObject>(entity: T.Type , completion: ([NSFetchRequestResult])->()) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = T.fetchRequest()
            do {
                let result = try managedObjectContext.fetch(fetchRequest)
                if result.count > 0 {
                    completion(result)
                }
            } catch let error as NSError{
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
}

extension CoreDataHelper {
    func deleteRecord<T:NSManagedObject>(entity:T.Type, completion:(Bool)->())
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = T.fetchRequest()
        do {
                    let result = try managedObjectContext.fetch(fetchRequest)
                    for obj in result {
                        managedObjectContext.delete(obj as! NSManagedObject)
                    }
            self.saveContext(managedObjectContext){ success in
                print(success)
            }
           }
        catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
           }
    }
}


extension CoreDataHelper {
    func saveContext(_ context: NSManagedObjectContext, completion:(Bool)->()) {
        //Persist new Event to datastore (via Managed Object Context Layer).
        do {
            try context.save()
            completion(true)
        } catch let error as NSError {
            print("save error: \(error), \(error.userInfo)")
            completion(false)
        }
    }
}
