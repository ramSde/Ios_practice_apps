//
//  TableViewCell.swift
//  Reminder
//
//  Created by Zignuts Tchnolab on 28/02/24.
//

import UIKit
protocol CustomCellDelegate: AnyObject {
  func didPressOptionButton(in cell: TableViewCell)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var costumLabel: UILabel!
    @IBOutlet weak var DateAndTimedataLabel: UILabel!
    weak var delegate: CustomCellDelegate?
    @IBAction func btntapped(){
        delegate?.didPressOptionButton(in: self)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
//        optionBtn.isUserInteractionEnabled = true
//        let btntapped = UITapGestureRecognizer(target: self, action: #selector(optionbtnpress))
//        optionBtn.addGestureRecognizer(btntapped)
        
        
    }
    @objc func optionbtnpress(){
        
    }
   
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifer = "TableViewCell"
    static func nib()-> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    func configure(with model : DateAndTimeModel){
        
        DateAndTimedataLabel.text = model.DateAndTimeString
        costumLabel.text = model.costum
        
    }
    private func setupUI() {
       // Make the cell's background transparent
       contentView.backgroundColor = .white
       // Add curved corners to the cell
       contentView.layer.cornerRadius = 15
       contentView.layer.masksToBounds = true
       // Optional: Add a border for better visualization
     }
    override func layoutSubviews() {
          super.layoutSubviews()
          contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    
    
}
