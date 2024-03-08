//
//  ViewController.swift
//  Locco_homeScreen
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var customSlider : UIView!
    @IBOutlet weak var SliderImage : UIImageView!
    @IBOutlet weak var SliderText : UILabel!
    
    @IBOutlet weak var ArrowImageinSlider: UIImageView!
    
      override func viewDidLoad() {
        super.viewDidLoad()
   
      
        customSlider.layer.cornerRadius = customSlider.frame.size.height/4
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
                  } else if newPos > customSlider.frame.size.width/1.420 {
                      newPos = customSlider.frame.size.width/1.420
                  }

                  touchedView.frame.origin.x = newPos

                  let diff = 100.0 - touchedView.frame.origin.x
                  SliderText.alpha = diff / 100
                  ArrowImageinSlider.alpha = diff/100

              } else if gestureRecognizer.state == .ended {
                  if touchedView.frame.origin.x == 200 {
                     
                      SliderText.alpha = 1
                  } else {
//                      touchedView.frame.origin.x = originalHorizontalPositionOfCancel
//                      SliderText.alpha = 1
                  }
              }

              UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
                  self.view.layoutIfNeeded()
              }, completion: nil)
          }
      }
    


}

