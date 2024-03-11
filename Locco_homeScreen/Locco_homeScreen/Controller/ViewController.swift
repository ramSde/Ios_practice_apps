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
    
    @IBOutlet weak var addReminderView: UIView!
    @IBOutlet weak var changeToDarkOrLightModeView: UIView!
    @IBOutlet weak var ArrowImageinSlider: UIImageView!
    
    @IBOutlet weak var RoutesView: UIView!
    @IBOutlet weak var latestDisvoriesView: UIView!
    @IBOutlet weak var spotLightView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
   setupSlider()
        setupviews()
    

    }
    func setupviews(){
        changeToDarkOrLightModeView.layer.cornerRadius = changeToDarkOrLightModeView.frame.size.height * 0.12
        RoutesView.layer.cornerRadius = RoutesView.frame.size.height * 0.12
        latestDisvoriesView.layer.cornerRadius = latestDisvoriesView.frame.size.height * 0.12
        spotLightView.layer.cornerRadius = spotLightView.frame.size.height * 0.08
        addReminderView.layer.cornerRadius = addReminderView.frame.size.height * 0.09

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
                      newPos = customSlider.frame.size.width/1.47
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

