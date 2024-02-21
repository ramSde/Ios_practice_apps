//
//  data_EntryPage.swift
//  TO_DO_App
//
//  Created by Zignuts Tchnolab on 20/02/24.
//

import UIKit

class data_EntryPage: UIViewController {
    @IBOutlet weak var tasklabel : UITextField!
    @IBOutlet weak var taskdescription : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        

        // Do any additional setup after loading the view.
    }
    @IBAction func ontap(_ Sender  : UIButton){
        let fistviewcontroller = ViewController.shared
       
     data.append(TODO(task: tasklabel.text ?? "empty", taskDescription: taskdescription!.text ??  "empty"))
       
        print(" on SECOND SCREEN data added :\( data)")
        navigationController?.popViewController(animated: true)
      
    }
    

  

}
