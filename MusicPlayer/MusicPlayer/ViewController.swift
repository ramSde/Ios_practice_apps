//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Zignuts Tchnolab on 23/02/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var musicTable : UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTable.dataSource = self
        musicTable.delegate = self
        
        
        
     
        
        
        
        
        // Do any additional setup after loading the view.
    }


}

