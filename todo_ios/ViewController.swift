//
//  ViewController.swift
//  todo_ios
//
//  Created by Raiyan Khan on 21/9/19.
//  Copyright © 2019 Raiyan Khan. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let realm = try! Realm()
    
    
    var items = [Item]()
    let cellReuseIdentifier = "itemCell"

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let itemList = realm.objects(Item.self)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        print(itemList)
       
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemList = realm.objects(Item.self)
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = realm.objects(Item.self)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        
        
        cell?.textLabel?.text = itemList[indexPath.row].title
        
        if itemList[indexPath.row].isChecked == true{
            cell?.accessoryType = .checkmark
        }
        else{
            cell?.accessoryType = .none
        }
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemList = realm.objects(Item.self)
        
            try! realm.write {
                itemList[indexPath.row].isChecked = !itemList[indexPath.row].isChecked
            }
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()

    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Update", handler: { (action, indexPath) in
            
            let alert = self.newAlertController("Update Item")
            
            let add = UIAlertAction(title: "Update", style: .default, handler: { (action) in
                self.items[indexPath.row].title = alert.textFields![0].text!
                self.tableView.reloadData()
            })
            
            alert.addTextField(configurationHandler: { (text) in
                text.placeholder = "new value"
            })
            
            alert.addAction(add)
            self.present(alert, animated: true, completion: nil)
            
        })
        editAction.backgroundColor = UIColor.cyan
        
        // action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
//         remove the item from the data model
            self.items.remove(at: indexPath.row)
            
                        // delete the table view row
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        deleteAction.backgroundColor = UIColor.red
        
        return [editAction, deleteAction]
    }
    
    
    @IBAction func addItem(_ sender: Any) {
        
        var textValue = UITextField()
        let alertController = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        // Create the actions
        let addAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textValue.text!
            
                //self.items.append(newItem)
                self.saveInRealm(newItem)
            
                self.tableView.reloadData()
            
        }
        
        // Add the actions
        alertController.addAction(addAction)
        
        alertController.addTextField { (text) in
            text.placeholder = "new item"
            textValue = text
        }

        // Present the controller
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    func newAlertController(_ title: String)-> UIAlertController{
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        
        return alert
    }
    
//    Save a new Item in Realm Database
    func saveInRealm(_ item: Item){
        do{
            try realm.write {
                realm.add(item)
            }
        }
        catch{
            print(error)
        }
        
    }
    
    
    
}

