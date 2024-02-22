//
//  ViewController.swift
//  collectionViewDemoApp
//
//  Created by Zignuts Tchnolab on 22/02/24.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var data : [String] = ["imagefl","imagefl","imagefl","imagefl","imagefl"]
    @IBOutlet weak var list_view : UICollectionView!
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: image_Cell_CollectionViewCell.identifier, for: indexPath) as!  image_Cell_CollectionViewCell
        print(" adding data in cell")
        
        cell.configure(image: data[indexPath.section])
        
        cell.configure2(image: data[indexPath.section])
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           // Calculate the cell size based on the screen dimensions
           let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
           let cellWidth = screenWidth  // You can adjust this value as needed
        let cellHeight = screenHeight/5 // You can adjust this value as needed

           return CGSize(width: cellWidth, height: cellHeight)
       }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        list_view.delegate = self
        list_view.dataSource = self
        // Create a UICollectionViewFlowLayout
              let layout = UICollectionViewFlowLayout()
              // Set the scroll direction to horizontal for a list view
              layout.scrollDirection = .vertical
              
              // Apply the layout to your UICollectionView
              list_view.collectionViewLayout = layout
        list_view.register(image_Cell_CollectionViewCell.nib(), forCellWithReuseIdentifier: "image_Cell_CollectionViewCell")
        
        // Do any additional setup after loading the view.
    }


}

