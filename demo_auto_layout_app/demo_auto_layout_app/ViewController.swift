//
//  ViewController.swift
//  demo_auto_layout_app
//
//  Created by Zignuts Tchnolab on 14/02/24.
//

import UIKit
    
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        clearall()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    var working : String = "";
    func addToWorkings(value: String)
        {
            working = working + value
            calculatorWorkings.text = working
        }
    
    func clearall(){
        
        working = ""
        calculatorResults.text = ""
        calculatorWorkings.text = ""
    }
  
    
    @IBAction func allclrbtn(_ sender: Any) {
        clearall()
    }
    

    @IBAction func clrbtn(_ sender: Any) {
        if(!working.isEmpty)
                {
                    working.removeLast()
                    calculatorWorkings.text = working
                }
        
    }
    
    
    @IBAction func onebtn(_ sender: UIButton) {
        addToWorkings(value: "1")
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        addToWorkings(value: "5")
    }
    @IBAction func divison(_ sender: Any) {
        addToWorkings(value: "/")
    }

    @IBAction func zero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    

    @IBAction func nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    

    @IBAction func multiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func seven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    

    @IBAction func six(_ sender: Any) {
        addToWorkings(value: "6")
    }

  
    

    @IBAction func minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    

    @IBAction func three(_ sender: Any) {
        addToWorkings(value: "3")
    }

  
    
    @IBAction func twobtn(_ sender: UIButton) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func sum(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func decimal(_ sender: Any) {
        addToWorkings(value: ".")
    }
    

    @IBAction func eqalbtn(_ sender: Any) {
        let expression = NSExpression(format: working)
        let result = expression.expressionValue(with: nil, context: nil) as! Double

        calculatorResults.text = String(result)
        
    }
   


    
    
    
}

