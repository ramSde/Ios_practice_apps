//
//  ViewController.swift
//  xylophone
//
//  Created by Zignuts Tchnolab on 26/02/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var Cbtn: UIView!
    
    @IBOutlet weak var Bbtn: UIView!
    @IBOutlet weak var Abtn: UIView!
    @IBOutlet weak var Gbtn: UIView!
    @IBOutlet weak var Fbtn: UIView!
    @IBOutlet weak var Ebtn: UIView!
    @IBOutlet weak var Dbtn: UIView!
    var player : AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        Abtn.isUserInteractionEnabled = true
        Bbtn.isUserInteractionEnabled = true
        Cbtn.isUserInteractionEnabled = true
        Dbtn.isUserInteractionEnabled = true
        Ebtn.isUserInteractionEnabled = true
        Fbtn.isUserInteractionEnabled = true
        Gbtn.isUserInteractionEnabled = true
       
        let tapcbtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapbbtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapdbtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapebtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapfbtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapgbtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
        let tapabtn = UITapGestureRecognizer(target : self , action: #selector(cbtnclick(_ :)))
      
        Abtn.addGestureRecognizer(tapabtn)
       
        Bbtn.addGestureRecognizer(tapbbtn)
        Cbtn.addGestureRecognizer(tapcbtn)
        Dbtn.addGestureRecognizer(tapdbtn)
        Ebtn.addGestureRecognizer(tapebtn)
        Fbtn.addGestureRecognizer(tapfbtn)
        Gbtn.addGestureRecognizer(tapgbtn)
        // Do any additional setup after loading the view.
    }
    

    @objc func cbtnclick(_ sender : UITapGestureRecognizer){
        
        print("\(sender.view?.tag) pressed")
        if(sender.view?.tag==0){
            playSound(key: "C")
        }
        if(sender.view?.tag==1){
            playSound(key: "D")
        }
        if(sender.view?.tag==2){
            playSound(key : "E")
        }
        if(sender.view?.tag==3){
            playSound(key : "F")
        }
        if(sender.view?.tag==4){
            playSound(key : "G")
        }
        if(sender.view?.tag==5){
            playSound(key : "A")
        }
        if(sender.view?.tag==6){
            playSound(key : "B")
        }
        
       
        
    }
    func playSound(key : String){
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
      }
   
    
}

