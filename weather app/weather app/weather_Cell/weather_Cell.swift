//
//  weather_Cell.swift
//  weather app
//
//  Created by Zignuts Tchnolab on 19/02/24.
//

import UIKit

class weather_Cell: UITableViewCell {
    @IBOutlet weak var weatherLabel : UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    var imagestring : String = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .green
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
               contentView.backgroundColor = .green
           } else {
               contentView.backgroundColor = .white
           }
            
        // Configure the view for the selected state
    }
    static let idnetifier = "weather_Cell"
    static  func nib() -> UINib{
        return UINib(nibName: "weather_Cell", bundle: nil)
    }
    
  func configure(with model : Weather) {
      weatherLabel.text = model.main
      weatherDescription.text = model.description
      if(model.main.contains("Rain")){
          weatherIcon.image = UIImage(named: "rain")
          imagestring = "rain"
      }
      if(model.main.contains("Clear")){
          weatherIcon.image = UIImage(named: "clear")
          imagestring = "clear"
      
      }
      if(model.main.contains("Cloud")){
          weatherIcon.image = UIImage(named: "cloud")
          imagestring = "cloud"
      }
      
    
      
        	
    }
   
    
 
    
}
