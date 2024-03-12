//
//  NavigationPageViewController.swift
//  BentBoxHomeScreen
//
//  Created by Zignuts Tchnolab on 12/03/24.
//

import UIKit

struct statsModel {
    let Statslabel : String
    let StatesImage : String
}


struct navigationModel {
    let prefixIcon : String
    let navigationPageLabel : String
}

class NavigationPageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var navigationSectionTableView : UITableView!
    @IBOutlet weak var statasticCollectionView : UICollectionView!
    
    @IBOutlet weak var statsView: UIStackView!
    let statsData : [statsModel] = [statsModel(Statslabel: "25", StatesImage: "Star ShineLogo"),statsModel(Statslabel: "18", StatesImage: "DiscoveriesPrefixLogo"), statsModel(Statslabel:"3" , StatesImage: "Map Arrow Up"),statsModel(Statslabel: "25",StatesImage: "Point On Map Perspective")]
    
    let navigationPagesData : [navigationModel] = [navigationModel(prefixIcon: "DiscoveriesPrefixLogo", navigationPageLabel: "Discoveries"), navigationModel(prefixIcon: "RoutesPrefixLogo", navigationPageLabel: "Routes"), navigationModel(prefixIcon: "RemindersPrefixLogo", navigationPageLabel: "Reminders"), navigationModel(prefixIcon: "UserLogo", navigationPageLabel: "My profile"), navigationModel(prefixIcon: "HowLoccoWorkPrefixIcon", navigationPageLabel: "How does LOCCO work?"), navigationModel(prefixIcon: "FaqPrefixLogo", navigationPageLabel: "FAQs & Support"),navigationModel(prefixIcon: "CopyrightLogo", navigationPageLabel: "Licenses & Legal") ]
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statsData.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatasticCollectionViewCell", for: indexPath) as! StatasticCollectionViewCell
        cell.statasticImageView.image = UIImage(named:  statsData[indexPath.section].StatesImage )
        cell.statasticLabel.text = statsData[indexPath.section].Statslabel
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
              case 0:
                  return 3 // First section with 3 rows
              case 1:
                  return 1 // Second section with 1 row
              case 2:
                  return 3 // Last section with 3 rows
              default:
                  return 0
              }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NavigationMenuTableViewCell") as! NavigationMenuTableViewCell
     
        
        switch indexPath.section {
               case 0:
         

                   cell.NavigationPageLabelText.text = navigationPagesData[indexPath.row].navigationPageLabel
                   cell.perfixIconImage.image = UIImage(named: navigationPagesData[indexPath.row].prefixIcon)
                           case 1:
                   cell.NavigationPageLabelText.text = navigationPagesData[3].navigationPageLabel // Assuming you want data from the fourth element for the second section
                   cell.perfixIconImage.image = UIImage(named: navigationPagesData[3].prefixIcon)
                   
               case 2:
                   cell.NavigationPageLabelText.text = navigationPagesData[indexPath.row + 4].navigationPageLabel // Assuming you want data starting from the fifth element for the third section
                   cell.perfixIconImage.image = UIImage(named: navigationPagesData[indexPath.row + 4].prefixIcon)
           
               default:
                   break
               }
     
        return cell
        
    }
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return navigationSectionTableView.frame.size.height * 0.01// Set the desired space between sections
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        navigationSectionTableView.frame.size.height * 0.115
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
        {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
            
                headerView.backgroundColor = UIColor.clear
            
            return headerView
        }
    
   

        

    override func viewDidLoad() {
        super.viewDidLoad()
        setuptableView()
        setupStatsCollectionView()
        

        // Do any additional setup after loading the view.
    }
    
    func setupStatsCollectionView() {
        statsView.layer.cornerRadius = statsView.frame.size.height * 0.125
        
        statasticCollectionView.delegate = self
        statasticCollectionView.dataSource = self
        statasticCollectionView.register(StatasticCollectionViewCell.nib(), forCellWithReuseIdentifier: StatasticCollectionViewCell.identifier)
      if let statscollectionView =  statasticCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
          statscollectionView.scrollDirection = .horizontal
        }
        DispatchQueue.main.async {
            self.statasticCollectionView.reloadData()
        }
    }
    func setuptableView() {
        navigationSectionTableView.separatorColor = UIColor(named: "AppThemeColor")

        navigationSectionTableView.delegate = self
        navigationSectionTableView.dataSource = self
       
        navigationSectionTableView.register(NavigationMenuTableViewCell.nib(), forCellReuseIdentifier: NavigationMenuTableViewCell.identfier)
        DispatchQueue.main.async {
            self.navigationSectionTableView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

