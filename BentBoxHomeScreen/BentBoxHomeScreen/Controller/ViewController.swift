//
//  ViewController.swift
//  BentBoxHomeScreen
//
//  Created by Zignuts Tchnolab on 11/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var customSlider : UIView!
    @IBOutlet weak var SliderImage : UIImageView!
    @IBOutlet weak var SliderText : UILabel!
    @IBOutlet weak var ArrowImageinSlider: UIImageView!
        @IBOutlet weak var secondView: UIView!
    override func viewDidLoad() {
           super.viewDidLoad()
        firstView.isHidden = false
        secondView.isHidden = true
        setupSlider()
   }
    
    func setupSlider(){
        customSlider.layer.cornerRadius = customSlider.frame.size.height * 0.40
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(touched(_:)))
        SliderImage.addGestureRecognizer(gestureRecognizer)
        SliderImage.isUserInteractionEnabled = true


    }
    @objc private func touched(_ gestureRecognizer: UIGestureRecognizer) {
          if let touchedView = gestureRecognizer.view {
              if gestureRecognizer.state == .changed {
                  let locationInView = gestureRecognizer.location(in: touchedView)

                  var newPos = touchedView.frame.origin.x + locationInView.x


                  // limit the scrolls to the edges of the parent view
                  if newPos < 10 {
                      newPos = 0
                  } else if newPos > customSlider.frame.size.width/1.55 {
                      newPos = customSlider.frame.size.width/1.55
                  }

                  touchedView.frame.origin.x = newPos

                  let diff = 100.0 - touchedView.frame.origin.x
                  SliderText.alpha = diff / 100
                  ArrowImageinSlider.alpha = diff/100

              } else if gestureRecognizer.state == .ended {
                  if touchedView.frame.origin.x == 200 {

                      SliderText.alpha = 1
                  }
              }

              UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
                  self.view.layoutIfNeeded()
              }, completion: nil)
          }
      }
    
    
    
    
    
     
    


}

