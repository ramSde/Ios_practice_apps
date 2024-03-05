//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var coinMangar = CoinManager()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  coinMangar.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinMangar.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        CurrencyTypeLabel.text = coinMangar.currencyArray[row]
        coinMangar.getData(currency: coinMangar.currencyArray[row])
        
        
    }
    
    @IBOutlet weak var CurrencyTypeLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        coinMangar.delegate = self
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
  
    

}
extension ViewController: CoinManagerDelegate {
    func didupdatedata(datamodel: DataModel) {
        DispatchQueue.main.async {
            self.RateLabel.text = datamodel.rateString()
            
        }
    }
    
}

