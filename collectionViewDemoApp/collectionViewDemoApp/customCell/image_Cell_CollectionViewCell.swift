//
//  image_Cell_CollectionViewCell.swift
//  collectionViewDemoApp
//
//  Created by Zignuts Tchnolab on 22/02/24.
//

import UIKit

class image_Cell_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var list_image: UIImageView!
    @IBOutlet weak var list_image2: UIImageView!
      
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
      
      static func nib() -> UINib {
          return UINib(nibName: "image_Cell_CollectionViewCell", bundle: nil)
      }
      
      static let identifier = "image_Cell_CollectionViewCell"
      
      func configure(image: String) {
          list_image.image = UIImage(named: image)
         
      }
    func configure2(image: String) {
        list_image2.image = UIImage(named: image)
       
    }

}
