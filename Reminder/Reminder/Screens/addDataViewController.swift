//
//  addDataViewController.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 27/02/24.
//

import UIKit

class addDataViewController: UIViewController {
  

    var editedDataTask : String = ""
    var editedDate : String = ""
    var ediatIndex : String = ""
        
  
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
       
            
            if(!task.isEmpty && !timefortask.isEmpty){
                guard let dateAndTimeText = EnterDateFiled.text
                else {
                    return
                }
                guard let TaskText = EnterCostum.text
                else {
                    return
                }
                if(!dateAndTimeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !TaskText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                    var index = Int(ediatIndex)!
                    print("\(data[index])")
                    
                    
                   let obj = DateAndTimeModel(DateAndTimeString: EnterDateFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines), costum:    EnterCostum.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                    data[index] =  obj
                    print("\(data[index])")
                    USerDataStoreOnLocal.defaults.setdataInDefaults()
                 
                    navigationController?.popViewController(animated: true)
                    }
               
              
            }
        else {
            guard let dateAndTimeText = EnterDateFiled.text
            else {
                return
            }
            guard let TaskText = EnterCostum.text
            else {
                return
            }
            if(!dateAndTimeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !TaskText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                data.append(DateAndTimeModel(DateAndTimeString: EnterDateFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines), costum: EnterCostum.text!.trimmingCharacters(in: .whitespacesAndNewlines)))
                USerDataStoreOnLocal.defaults.setdataInDefaults()
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
        let currentDate = NSDate()
        dateTimePicker.minimumDate =  currentDate as Date
     
        
        
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
