//
//  ViewController.swift
//  EggTimer
//
//  Created by Zignuts Tchnolab on 26/02/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressbar : UIProgressView!
    var second = 0
    var eggtimes = ["Soft" :3 , "Medium" : 4 , "Hard" : 7]
    var timer = Timer()
    var total = 0
    @IBOutlet weak var condition : UILabel!
    @IBAction func eggTouched (_ sender : UIButton){
        progressbar.progress = 0.0
        let  hardness = sender.titleLabel?.text
         total =  eggtimes[hardness!]!
        second = 0
        condition.text = hardness
        timer.invalidate()
            timer =   Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerchanger), userInfo: nil, repeats: true)
            
        
    }
    @objc func timerchanger(){
        if(second<total){
       print("\(second)")
            second += 1
            progressbar.progress = Float(second)/Float(total)
        
        }
        else{
            timer.invalidate()
            condition.text = "Done!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressbar.progress = 0.0
        condition.text = "Soft"
        // Do any additional setup after loading the view.
    }


}

