//
//  ViewController.swift
//  Todoey
//
//  Created by Taplinx dev on 19/11/19.
//  Copyright © 2019 Taplinx dev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["find book","buy milk","tv repair"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
    //MARK - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

// MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   //MARK - Pressing Add Button
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newAddedItem = UITextField()
        
        let alert = UIAlertController(title: "Add new Todo Item", message: "", preferredStyle: .alert)
        
           alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            newAddedItem = alertTextField
            }
        
        let action = UIAlertAction(title: "New Item", style: .default) { (action) in
            
            self.itemArray.append(newAddedItem.text!)
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    
    
    
}

