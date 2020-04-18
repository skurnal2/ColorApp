//
//  ToDoViewController.swift
//  ColorApp
//
//  Created by user166663 on 4/18/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController {

    var dataManager: NSManagedObjectContext!
    
    var todoList = [NSManagedObject]()
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    
    
    @IBAction func addNewTodoItem(_ sender: UIButton) {
        
         let newTodoItem = NSEntityDescription.insertNewObject(forEntityName: "ToDoItem", into: dataManager)
               
               newTodoItem.setValue(titleText.text!, forKey: "entryTitle")
               newTodoItem.setValue(descriptionText.text!, forKey: "entryDescription")
        newTodoItem.setValue(Date(), forKey: "createdDate")
               
               do {
                   try dataManager.save()
               } catch {
                   print("Cannot save todo item.")
               }
               
               // empty the text in the TextFields and TextView
               titleText.text?.removeAll()
               descriptionText.text?.removeAll()
              
                //Reloading the table view
    }
    
    func getAllTodoItems() -> [NSManagedObject] {
         let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ProductItem")
               do {
                   let result = try dataManager.fetch(fetchRequest)
                   todoList = result as! [NSManagedObject]
               } catch {
                   print("Error reading data")
               }
        return todoList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
