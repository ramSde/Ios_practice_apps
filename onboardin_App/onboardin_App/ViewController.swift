//
//  ViewController.swift
//  onboardin_App
//
//  Created by Zignuts Tchnolab on 23/02/24.
//

import UIKit
class isNewUser{
   
    
    static let objIsNewUser = isNewUser()

    static let defauts = UserDefaults.standard
    func IsNewuUser() -> Bool{
      return  !isNewUser.defauts.bool(forKey: "isnewuser")
    }
    
    func setisnotnewuser() {
        isNewUser.defauts.set(true, forKey: "isnewuser")
      
    
    }
    
}
class ViewController: UIViewController {
    @IBOutlet weak var hwc : UIView!

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if(isNewUser.objIsNewUser.IsNewuUser()){

            
            var wvc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            wvc.modalPresentationStyle = .fullScreen
            present(wvc, animated: true)
        }
        else{
            configure()
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure() 
        // Do any additional setup after loading the view.
    }
    
    func  configure(){
        
        let img = UIImageView(frame:CGRect(x: 0, y: 0, width: hwc.frame.size.width, height: hwc.frame.size.height))
        
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "homepage")
        
           hwc.addSubview(img)
        
     }
    
    


}

