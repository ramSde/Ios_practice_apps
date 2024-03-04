//
//  addDataViewController.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 27/02/24.
//

import UIKit
import UserNotifications

class addDataViewController: UIViewController {
  

    var editedDataTask : String = ""
    var editedDate : String = ""
    var ediatIndex : String = ""
    var unique_notification_id = ""
  
    let dateTimePicker = UIDatePicker()
  
    func initializeView(){
        navigationItem.hidesBackButton = true
        EnterCostum.borderStyle = .none
        EnterCostum.layer.cornerRadius = 20
        EnterCostum.layer.borderWidth = 2
        EnterCostum.layer.borderColor = UIColor.white.cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: EnterCostum.frame.size.height))
        EnterCostum.attributedPlaceholder = NSAttributedString(string: "Where to ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        EnterCostum.leftView = paddingView
        EnterCostum.leftViewMode = .always
              // Set the padding view as the left view of the text field
        EnterDateFiled.leftView = paddingView
        EnterDateFiled.leftViewMode = .always
        EnterDateFiled.borderStyle = .none
        EnterDateFiled.layer.cornerRadius = 20
        EnterDateFiled.layer.borderWidth = 2
        EnterDateFiled.layer.borderColor = UIColor.white.cgColor
        let paddingViewfordate = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: EnterCostum.frame.size.height))
        EnterDateFiled.attributedPlaceholder = NSAttributedString(string: "What Date and Time ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])

              // Set the padding view as the left view of the text field
        EnterDateFiled.leftView = paddingViewfordate
        EnterDateFiled.leftViewMode = .always
       

    }

    @IBOutlet weak var EnterCostum: UITextField!
    
    @IBOutlet weak var EnterDateFiled: UITextField!
    @IBAction func AddNewDataBtn(_ sender: UIButton) {
        
        let   task  = editedDataTask
          let timefortask = editedDate
        guard let dateAndTimeText = EnterDateFiled.text
        else {
            return
        }
        guard let TaskText = EnterCostum.text
        else {
            return
        }
            
            if(!task.isEmpty && !timefortask.isEmpty){
              
                if(!dateAndTimeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !TaskText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                    var index = Int(ediatIndex)!
                    print("\(data[index])")
                    
                    
                   var obj = DateAndTimeModel(DateAndTimeString: EnterDateFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines), costum:    EnterCostum.text!.trimmingCharacters(in: .whitespacesAndNewlines),notifacitonId: data[index].notifacitonId!)
                    data[index] =  obj
                    print("\(data[index])")
                    USerDataStoreOnLocal.defaults.setdataInDefaults()
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [data[index].notifacitonId!])
                    let content = UNMutableNotificationContent()
                    content.title = "Reminder: \(TaskText)"
                         content.body = ": \(TaskText)"
                         content.sound = UNNotificationSound.default
                    let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateTimePicker.date)
                         let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                   
                    obj.notifacitonId = "_reminder_" + UUID().uuidString
                             let request = UNNotificationRequest(identifier: obj.notifacitonId!, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { (error) in
                      if let error = error {
                        print("Failed to schedule notification: \(error.localizedDescription)")
                      } else {
                        print("Notification scheduled successfully")
                      }
                    }

                    navigationController?.popViewController(animated: true)
                    }
               
              
            }
        else {
            
            if(!dateAndTimeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !TaskText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                let uniqueID = "_reminder_" + UUID().uuidString
                data.append(DateAndTimeModel(DateAndTimeString: EnterDateFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines), costum: EnterCostum.text!.trimmingCharacters(in: .whitespacesAndNewlines),notifacitonId : uniqueID))
                USerDataStoreOnLocal.defaults.setdataInDefaults()
                
                let content = UNMutableNotificationContent()
                content.title = "Reminder: \(TaskText)"
                     content.body = ": \(TaskText)"
                     content.sound = UNNotificationSound.default
                let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateTimePicker.date)
                     let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                     let request = UNNotificationRequest(identifier: uniqueID, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                  if let error = error {
                    print("Failed to schedule notification: \(error.localizedDescription)")
                  } else {
                    print("Notification scheduled successfully")
                  }
                }

                
                navigationController?.popViewController(animated: true)
                
                
                
                
            }
            
          
            
        }
       
      
            
                    
            
            
        
    
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        initializeView()
     
        
        dateTimePicker.datePickerMode = .dateAndTime
        dateTimePicker.preferredDatePickerStyle = .inline
        EnterDateFiled.inputView = dateTimePicker
        
        dateTimePicker.backgroundColor = .white
        let customColor = UIColor(
            red: CGFloat(108) / 255.0,
            green: CGFloat(194) / 255.0,
            blue: CGFloat(181) / 255.0,
            alpha: 1.0
        )

        dateTimePicker.tintColor = customColor
        
        dateTimePicker.frame = CGRect(x: 10, y: 0, width: 20, height: 450)
        let currentDate = NSDate() as Date             
        dateTimePicker.minimumDate =  currentDate
     
        
        
        let toolbar = UIToolbar()
                toolbar.sizeToFit()
//
                let doneDateButton = UIBarButtonItem(title: "Done (Date)", style: .plain, target: self, action: #selector(doneDateButtonPressed))
           

                toolbar.setItems([doneDateButton], animated: true)
        EnterDateFiled.inputAccessoryView = toolbar
      
        
 

        
        
        if(!editedDate.isEmpty  &&  !editedDataTask.isEmpty ){
            EnterDateFiled.text = editedDate
            EnterCostum.text = editedDataTask
        }
      
    
       
       

        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    @objc func doneDateButtonPressed() {
           // Format the selected date and update the text field
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        EnterDateFiled.text = dateFormatter.string(from: dateTimePicker.date)
        
        EnterDateFiled.resignFirstResponder()
       }

    
    @IBAction func CancelBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    /*
     @IBAction func backBtn(_ sender: UIButton) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
