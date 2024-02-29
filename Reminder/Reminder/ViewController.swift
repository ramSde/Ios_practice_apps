//
//  ViewController.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 26/02/24.
//

import UIKit
struct DateAndTimeModel : Codable{
    var DateAndTimeString : String
    var costum : String
}
class USerDataStoreOnLocal{
    
    
    static let defaults = USerDataStoreOnLocal()
    func getDataFromDefaults() -> [DateAndTimeModel] {
        
        if let storedData = UserDefaults.standard.data(forKey: "dataArray") {
              do {
                  let decoder = JSONDecoder()
                  data = try decoder.decode([DateAndTimeModel].self, from: storedData)
              } catch {
                  print("Error decoding data: \(error)")
              }
          } else {
              data = []
          }
        return data
    }

    
   func setdataInDefaults() {
       do {
              let encoder = JSONEncoder()
              let encodedData = try encoder.encode(data)
              UserDefaults.standard.set(encodedData, forKey: "dataArray")
          } catch {
              print("Error encoding data: \(error)")
          }

    }
    
    
    
    
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
        USerDataStoreOnLocal.defaults.setdataInDefaults()
        updateUiOnDataAdd()
        if(data.isEmpty){
            DataisEmptyUI.isHidden = false
        }
      }
    private func handleEdit(cell : TableViewCell) {
        let datetimedata = cell.DateAndTimedataLabel.text!
      
        let taskdata = cell.costumLabel.text!
        
         let indexPath = ReminderTable.indexPath(for: cell)!
              let row = indexPath.row
         
          
      performSegue(withIdentifier: "mainScreenToAddDataScreen", sender: [datetimedata,taskdata,String(row)])
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "mainScreenToAddDataScreen" {
        if let addScreenVC = segue.destination as? addDataViewController, let reminder = sender as? [String] {
            addScreenVC.editedDate = reminder[0]
            addScreenVC.editedDataTask = reminder[1]
            addScreenVC.ediatIndex = reminder[2]
         
        }
      }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")  as! TableViewCell
        cell.configure(with: data[indexPath.row])
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the desired height for cells
        return 100// Adjust this value to your desired height
      }
    
    
    

    @IBOutlet weak var ReminderTable: UITableView!
    override func viewDidLoad() {
     data =   USerDataStoreOnLocal.defaults.getDataFromDefaults()
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
        data = USerDataStoreOnLocal.defaults.getDataFromDefaults()
        DispatchQueue.main.async { [self] in
            ReminderTable.reloadData()
        }

    }


}

