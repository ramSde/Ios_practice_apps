//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice1: UIImageView!
    var data : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [UIImage(imageLiteralResourceName: "DiceOne"),UIImage(imageLiteralResourceName: "DiceTwo"),UIImage(imageLiteralResourceName: "DiceThree"),UIImage(imageLiteralResourceName: "DiceFour"),UIImage(imageLiteralResourceName: "DiceFive"),UIImage(imageLiteralResourceName: "DiceSix")]
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func rolldicebtn(_ sender: Any) {
        
        let randomIndex1 = Int.random(in: 0..<data.count)
        let randomIndex2 = Int.random(in: 0..<data.count)
        dice1.image =  data[randomIndex1]
        dice2.image = data[randomIndex2]
        
    }
    
}

