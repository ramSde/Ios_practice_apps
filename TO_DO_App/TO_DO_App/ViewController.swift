//
//  ViewController.swift
//  TO_DO_App
//
//  Created by Zignuts Tchnolab on 20/02/24.
//

import UIKit
import Foundation
struct TODO : Codable{
    let task : String
    let taskDescription : String
}
    var data :[TODO] = []

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    static let shared = ViewController()

 

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todo_Cell",for: indexPath) as! todo_Cell
       
        print(" adding data to cell \(data)")
        cell.selectionStyle = .none
        cell.configure(with: data[indexPath.row])
     
        return cell
    }
   
   
    

    @IBAction func addNewTODO(_ sender: UIButton) {
        print(" currently data is    \(data)")

        performSegue(withIdentifier: "ftos", sender: nil)
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        updateTableData()
    }
   

    
    
    
    @IBOutlet weak var todo_table : UITableView!
    
    func updateTableData() {
        print("at MAIN SCREEN  data updated: \(data)")
        DispatchQueue.main.async {
            self.todo_table?.reloadData()
        }
        
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        todo_table.delegate = self
        todo_table.dataSource = self
        todo_table.register(todo_Cell.nib(), forCellReuseIdentifier: todo_Cell.identifier)
     
        updateTableData()
       
        // Do any additional setup after loading the view.
    }

    }




