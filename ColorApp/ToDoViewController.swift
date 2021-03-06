//
//  ToDoViewController.swift
//  ColorApp
//
//  Created by user166663 on 4/18/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit
import CoreData

extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}

class ToDoViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var todoList = [NSManagedObject]()
    
    var dataManager: NSManagedObjectContext!
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    @IBOutlet weak var todoListTable: UITableView!
    
    @IBAction func doneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        cell.textLabel?.text = todoList[indexPath.row].value(forKey: "entryTitle") as? String
        
        cell.detailTextLabel?.text = todoList[indexPath.row].value(forKey: "entryDescription") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todoItemToDelete = todoList[indexPath.row]
            dataManager.delete(todoItemToDelete)
            todoList.remove(at: indexPath.row)
            todoListTable.deleteRows(at: [indexPath], with: .fade)

            do {
                try
                    dataManager.save()
            } catch {
                print("Cannot delete the todo item.")
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todoItemToShow = todoList[indexPath.row]
        let todotitle = todoItemToShow.value(forKey: "entryTitle") as? String
        let description = todoItemToShow.value(forKey: "entryDescription") as? String
        let date = todoItemToShow.value(forKey: "createdDate") as? Date
        let newMessage: String = "Created Date : " + (date?.asString(style: .long))! + "\n\n" + description!
        
        let alertController = UIAlertController(title: todotitle, message: newMessage, preferredStyle: .alert)
               
               let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
                 
               alertController.addAction(doneAction)
           
               present(alertController, animated: true, completion: nil)
        
    }
    
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
                todoList = getAllTodoItems()
                todoListTable.reloadData()
    }
    
    func getAllTodoItems() -> [NSManagedObject] {
         let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ToDoItem")
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
            todoList = getAllTodoItems()
    }
}
