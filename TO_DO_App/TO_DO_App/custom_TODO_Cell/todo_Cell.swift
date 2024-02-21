//
//  todo_Cell.swift
//  TO_DO_App
//
//  Created by Zignuts Tchnolab on 20/02/24.
//

import UIKit

class todo_Cell: UITableViewCell {
    @IBOutlet weak var tasklabel : UILabel!
    @IBOutlet weak var taskdecription : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .gray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   static func nib() -> UINib {
        return UINib(nibName: "todo_Cell"  , bundle: nil)
    }
  static  let identifier = "todo_Cell"
    
    func configure(with model : TODO){
        tasklabel.text = model.task
        taskdecription.text = model.taskDescription
        
        
        
    }
    
}
