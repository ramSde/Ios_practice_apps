//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray  = ["hello","hii","byy"]
    var textfield = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell",for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
            return cell
        
        }
    
    
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

    @IBAction func AddNewBtn(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todo", message: "", preferredStyle: .alert)
        alert.addTextField{
            (alerTextField) in
            alerTextField.placeholder = "add new item"
            self.textfield = alerTextField
            
        }
        
        let action = UIAlertAction(title: "add item", style: .default){ (action) in
            
            self.itemArray.append(self.textfield.text ?? "")
            
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert,animated: true)
        
        
    }
    
}

