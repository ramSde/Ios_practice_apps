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
               
                var index = Int(ediatIndex)!
                print("\(data[index])")
                
               let obj = DateAndTimeModel(DateAndTimeString:  EnterDateFiled.text!, costum:    EnterCostum.text!)
                data[index] =  obj
                print("\(data[index])")
                USerDataStoreOnLocal.defaults.setdataInDefaults()
             
                navigationController?.popViewController(animated: true)
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
                data.append(DateAndTimeModel(DateAndTimeString: EnterDateFiled.text!, costum: EnterCostum.text!))
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
        
        
        dateTimePicker.frame = CGRect(x: 0, y: 0, width: 0, height: 450)
        let currentDate = NSDate()
        dateTimePicker.minimumDate =  currentDate as Date
   //     dateTimePicker.setValue(UIColor(cgColor: CGColor(red: 108, green: 194, blue: 181, alpha: 1)), forKey: "textColor")
        
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
      
    
       
       
//
//        let stackView = UIStackView(arrangedSubviews: [dateTimePicker, toolbar])
//                stackView.axis = .vertical
//                stackView.spacing = 8
//                stackView.distribution = .fillEqually
//
//        EnterDateFiled.inputView = stackView
//
//                // Add constraints to ensure the stack view fits within the visible area
//                stackView.translatesAutoresizingMaskIntoConstraints = false
//                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        view.addSubview(dateTimePicker)
        // Do any additional setup after loading the view.
        
        
      
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    @objc func doneDateButtonPressed() {
           // Format the selected date and update the text field
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        EnterDateFiled.text = dateFormatter.string(from: dateTimePicker.date)
        EnterDateFiled.textColor = .blue
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
