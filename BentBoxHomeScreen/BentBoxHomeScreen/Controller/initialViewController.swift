//
//  initialViewController.swift
//  BentBoxHomeScreen
//
//  Created by Zignuts Tchnolab on 12/03/24.
//

import UIKit

class initialViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var addReminderView: UIView!
    @IBOutlet weak var changeToDarkOrLightModeView: UIView!
  

    @IBOutlet weak var RoutesView: UIView!
    @IBOutlet weak var latestDisvoriesView: UIView!
    @IBOutlet weak var spotLightView: UIView!

    @IBOutlet weak var DiscoveriesCollectionView : UICollectionView!
  
    let data : [String] = ["Entdeckung01","Entdeckung02","Entdeckung03"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellForDiscoverisCollectionViewCell", for: indexPath) as! CollectionViewCellForDiscoverisCollectionViewCell
        
        cell.imageForDiscoveries.image = UIImage(named: data[indexPath.section])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
 
    }
func     setupDiscoverisCollectionView() {
    DiscoveriesCollectionView.dataSource = self
    DiscoveriesCollectionView.delegate = self
    DiscoveriesCollectionView.register(CollectionViewCellForDiscoverisCollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCellForDiscoverisCollectionViewCell.identfier)
    DiscoveriesCollectionView.isScrollEnabled = true
    if let discoveriesview =   DiscoveriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        discoveriesview.scrollDirection = .horizontal
    }
    DispatchQueue.main.async {
        self.DiscoveriesCollectionView.reloadData()
    }
        
    }
    
 
       
    
    
    
    func setupviews(){
        changeToDarkOrLightModeView.layer.cornerRadius = changeToDarkOrLightModeView.frame.size.height * 0.12
        RoutesView.layer.cornerRadius = RoutesView.frame.size.height * 0.12
        latestDisvoriesView.layer.cornerRadius = latestDisvoriesView.frame.size.height * 0.12
        spotLightView.layer.cornerRadius = spotLightView.frame.size.height * 0.08
        addReminderView.layer.cornerRadius = addReminderView.frame.size.height * 0.09

    }

    
    
    
    

}
