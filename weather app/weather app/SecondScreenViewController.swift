//
//  SecondScreenViewController.swift
//  weather app
//
//  Created by Zignuts Tchnolab on 20/02/24.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    var descriptionofweather : String = "" ;
    var maintext : String = "" ;
    var imagestring : String = "" ;
    
    
    
   
  
    @IBOutlet weak var lname: UILabel!
    
    @IBOutlet weak var descriptiontext: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(maintext)")
        print("\(descriptionofweather)")
        print("\(imagestring)")
        lname.text = maintext
        imageview.image = UIImage(named: imagestring)
        descriptiontext.text = descriptionofweather

        // Do any additional setup after loading the view.
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
