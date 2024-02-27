//
//  addDataViewController.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 27/02/24.
//

import UIKit

class addDataViewController: UIViewController {
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
    override func viewDidLoad() {
       
        super.viewDidLoad()
        initializeView()
        dateTimePicker.datePickerMode = .dateAndTime
        EnterDateFiled.inputView = dateTimePicker
        let toolbar = UIToolbar()
                toolbar.sizeToFit()
//
                let doneDateButton = UIBarButtonItem(title: "Done (Date)", style: .plain, target: self, action: #selector(doneDateButtonPressed))
                let doneTimeButton = UIBarButtonItem(title: "Done (Time)", style: .plain, target: self, action: #selector(doneTimeButtonPressed))

                toolbar.setItems([doneDateButton, doneTimeButton], animated: true)

        EnterDateFiled.inputAccessoryView = toolbar
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
    @objc func doneDateButtonPressed() {
           // Format the selected date and update the text field
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        EnterDateFiled.text = dateFormatter.string(from: dateTimePicker.date)
        EnterDateFiled.resignFirstResponder()
       }

       @objc func doneTimeButtonPressed() {
           // Format the selected time and update the text field
           let timeFormatter = DateFormatter()
           timeFormatter.dateFormat = "HH:mm"
           EnterDateFiled.text = timeFormatter.string(from: dateTimePicker.date)
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
