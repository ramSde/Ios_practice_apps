//
//  WelcomeViewController.swift
//  onboardin_App
//
//  Created by Zignuts Tchnolab on 23/02/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var wcView : UIView!
    let scrollview = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
        		

        // Do any additional setup after loading the view.
    }
    func configure() {
        
         scrollview.frame =  wcView.bounds
        let titles = ["wecome","location", "all Done"]
        let imagesset = ["image1","image2","image3"]
        wcView.addSubview(scrollview)
        
        for x in 0..<3 {
            let pageview = UIView(frame: CGRect(x: CGFloat(x)*wcView.frame.size.width, y: 0, width: wcView.frame.size.width, height: wcView.frame.size.height))
           
            
            let uiLbl = UILabel(frame: CGRect(x: wcView.frame.size.width/3, y: 10, width: 120, height: 120))
            let uiImg = UIImageView(frame: CGRect(x:  wcView.frame.size.width/3.3, y: 10+120+10, width: wcView.frame.size.width/2.2, height: pageview.frame.size.height-60-130-10))
            let uiBtn = UIButton(frame: CGRect(x:  wcView.frame.size.width/3.5, y: pageview.frame.size.height-60, width:  wcView.frame.size.width/2, height: 40))
            
            uiLbl.textAlignment = .center
            uiLbl.font.withSize(CGFloat(52))
            uiLbl.text = titles[x]
            uiImg.image = UIImage(named: imagesset[x])
            if(x<2){
                uiBtn.setTitle("Continue", for: .normal)
            }
            else {
                uiBtn.setTitle("Start Exploring", for: .normal)
            }
           
            uiImg.contentMode = .scaleAspectFit
            uiBtn.addTarget(self, action: #selector(didTapBtn(_:)), for: .touchUpInside)
            uiBtn.backgroundColor = .black
            uiBtn.tag = x+1
            pageview.addSubview(uiLbl)
            pageview.addSubview(uiImg)
            pageview.addSubview(uiBtn)
            scrollview.addSubview(pageview)
            
            
        }
        scrollview.contentSize = CGSize(width: wcView.frame.size.width*3, height:  wcView.frame.size.height)
        scrollview.isScrollEnabled = true
        scrollview.isPagingEnabled = true
        
        
    }
    @objc func didTapBtn(_ sender : UIButton){
        if(sender.tag<3){
            scrollview.setContentOffset(CGPoint(x:wcView.frame.size.width*CGFloat(sender.tag), y: 0), animated: true)
        }
        else{
            isNewUser.objIsNewUser.setisnotnewuser()
            
            dismiss(animated: true)
       
        }
      
        
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
