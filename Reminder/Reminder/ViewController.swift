//
//  ViewController.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 26/02/24.
//

import UIKit
struct DateAndTimeModel{
    var DateAndTimeString : String
    var costum : String
}
 var data : [DateAndTimeModel] = []
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CustomCellDelegate {
 
    @IBOutlet weak var EmptyScreenText: UIView!
    @IBOutlet weak var NavigationBarAddNewData: UIView!
    @IBOutlet weak var DataisEmptyUI: UIView!
    
    @IBAction func CreateNewReminder(_ sender: Any) {
        performSegue(withIdentifier: "mainScreenToAddDataScreen", sender: nil)
    }
    
    
    func didPressOptionButton(in cell: TableViewCell) {
        let alertController = UIAlertController(title: "Options", message: "Choose an action", preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "Edit", style: .default) { _ in
//           Handle edit action
          self.handleEdit(cell: cell)
        }
        alertController.addAction(editAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
          // Handle delete action
          self.handleDelete(cell: cell)
        }
        alertController.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        // Present the alert controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    static let vc = ViewController()
    
    
    private func handleDelete(cell: TableViewCell) {
        guard let indexPath = ReminderTable.indexPath(for: cell) else { return }
        // Perform deletion logic
        data.remove(at: indexPath.row)
        ReminderTable.deleteRows(at: [indexPath], with: .automatic)
        updateUiOnDataAdd()
        if(data.isEmpty){
            DataisEmptyUI.isHidden = false
        }
      }
    private func handleEdit(cell : TableViewCell) {
      performSegue(withIdentifier: "mainScreenToAddDataScreen", sender: nil)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")  as! TableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the desired height for cells
        return 100// Adjust this value to your desired height
      }
    
    
    

    @IBOutlet weak var ReminderTable: UITableView!
    override func viewDidLoad() {
        EmptyScreenText.layer.cornerRadius = 15
        super.viewDidLoad()
        if(!data.isEmpty){
            DataisEmptyUI.isHidden = true
        }
        
        ReminderTable.dataSource = self
        ReminderTable.delegate = self
        ReminderTable.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifer)
        let tapbtn = UITapGestureRecognizer(target: self, action: #selector(addbtnpress))
        NavigationBarAddNewData.isUserInteractionEnabled = true
        NavigationBarAddNewData.addGestureRecognizer(tapbtn)
      
        
        updateUiOnDataAdd()
       
        // Do any additional setup after loading the view.
    }
    @objc func addbtnpress() {
        performSegue(withIdentifier: "mainScreenToAddDataScreen", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        if(!data.isEmpty){
            DataisEmptyUI.isHidden = true
        }
        updateUiOnDataAdd()
    }
    func updateUiOnDataAdd(){
        DispatchQueue.main.async { [self] in
            ReminderTable.reloadData()
        }

    }


}

