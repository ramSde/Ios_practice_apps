//
//  addReminderPage.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 26/02/24.
//

import UIKit

class addReminderPage: UIViewController {

    @IBOutlet weak var NavBarAddReminderBtn: UIView!
    @IBAction func createNewRemiderBtn(_ sender: Any) {
       performSegue(withIdentifier: "EmptyScreenToEnterDataScreen", sender: nil)

       
        
    }
    @IBOutlet weak var textView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 16
        let tapfunc = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        NavBarAddReminderBtn.addGestureRecognizer(tapfunc)
        
      
        

        // Do any additional setup after loading the view.
    }
    @objc func viewTapped(){
        performSegue(withIdentifier: "EmptyScreenToEnterDataScreen", sender: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
