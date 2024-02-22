//
//  ViewController.swift
//  collectionViewDemoApp
//
//  Created by Zignuts Tchnolab on 22/02/24.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var data : [String] = [
        "imagescl","imagefl","XY","imagefl","imagescl","XY","imagescl","imagefl","XY","imagefl","XY","imagescl","imagefl","XY","imagescl","imagefl","XY","imagefl","XY","imagescl","XY","imagescl","imagefl","XY","imagefl","XY"
        ,"imagescl","imagefl","imagefl","imagescl","imagefl","imagefl","imagescl","imagescl","imagefl","imagefl","imagescl","imagefl","imagefl","imagefl","imagescl","XY","imagefl","imagescl","XY","imagescl","imagefl","XY","imagefl","imagescl","imagefl","XY","imagescl","imagefl","imagescl"
    ]
    @IBOutlet weak var list_view : UICollectionView!
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(data.count)")
        
        return data.count
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: image_Cell_CollectionViewCell.identifier, for: indexPath) as!  image_Cell_CollectionViewCell
        print(" adding data in cell")
    
        
        cell.configure(image: data[indexPath.item])
        
    
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   insetForSectionAt section: Int) -> UIEdgeInsets {
         /// 2
         return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
     }
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
           /// 4
           let lay = collectionViewLayout as! UICollectionViewFlowLayout
           /// 5
           let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
           /// 6
           return CGSize(width: widthPerItem - 8, height: 250)
       }
    

    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        list_view.delegate = self
        list_view.dataSource = self
        // Create a UICollectionViewFlowLayout
              let layout = UICollectionViewFlowLayout()
              // Set the scroll direction to horizontal for a list view
              layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
            /// 5
            layout.minimumInteritemSpacing = 4
//               Apply the layout to your UICollectionView
              list_view.collectionViewLayout = layout
        list_view.register(image_Cell_CollectionViewCell.nib(), forCellWithReuseIdentifier: "image_Cell_CollectionViewCell")
        
        // Do any additional setup after loading the view.
    }


}

