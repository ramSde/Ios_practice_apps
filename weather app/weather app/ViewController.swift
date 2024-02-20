//
//  ViewController.swift
//  weather app
//
//  Created by Zignuts Tchnolab on 19/02/24.
//

import UIKit
import CoreLocation
import Foundation


struct WeatherResponse: Codable {
    let weather : [Weather]
}
struct Weather: Codable {
       let id: Int
    let main : String
       let description: String
       let icon: String
       
       
   }












class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , CLLocationManagerDelegate {
    var currentlocation : CLLocation?
    let locationmanager = CLLocationManager()
    @IBOutlet var table: UITableView!
    var models = [Weather]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ftos" {
            if let destinationVC = segue.destination as? SecondScreenViewController {
                if let data = sender as? (String, String,String) {
                    // Pass the data to the second screen
                    print("\(data.0)")
                    print("\(data.1)")
                    print("\(data.2)")
                    destinationVC.maintext = data.0
                    destinationVC.descriptionofweather = data.1
                    destinationVC.imagestring = data.2
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? weather_Cell {
              // Access data from your cell, for example:
            let maintext = cell.weatherLabel.text
            let descriptionText = cell.weatherDescription.text
            let icontext = cell.imagestring

              // Perform navigation to the second screen
              performSegue(withIdentifier: "ftos", sender: (maintext, descriptionText,icontext))
          }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: weather_Cell.idnetifier,for: indexPath) as! weather_Cell
        cell.configure(with: models[indexPath.row])
return cell
    }
   
    
    
 func setuplocation()
    {
        locationmanager.delegate = self
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(!locations.isEmpty && currentlocation==nil ){
            currentlocation = locations.first
            locationmanager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    func requestWeatherForLocation(){
        if(currentlocation != nil){
            let longitude = currentlocation?.coordinate.longitude
            let lattitude = currentlocation?.coordinate.latitude
             print("\(lattitude)")
            print("\(longitude)")
           
            var url = "https://api.openweathermap.org/data/2.5/weather?lat=20.5937&lon=78.9629&appid=fa6d2eddf94f31b058fad6099d89d6bf"
                        URLSession.shared.dataTask(with:  URL(string: url)!, completionHandler: {data ,reponse, error in
                            
                            if(data==nil){
                                print("data not found")
                            }
                            else{
//                                print(String(data: data!, encoding: .utf8) ?? "Data is nil")
//                                print("\(URL(string : url))")
                                
                                var json : WeatherResponse?
                                do{
                                    try json = JSONDecoder().decode(WeatherResponse.self, from: data!)
                                    self.models.append(contentsOf: json!.weather)
                                    self.models.append(Weather(id: 99, main: "Rain", description: "Rainy little bit", icon: ""))
                                    self.models.append(Weather(id: 88, main: "Cloud", description: "Cloudy little bit", icon: ""))
                                    self.models.append(Weather(id: 77, main: " Clear", description: "Its very good environment", icon: ""))
                                    self.models.append(Weather(id: 66, main: "Rain", description: "Rainy little bit", icon: ""))
                                    self.models.append(Weather(id: 88, main: "Cloud", description: "Cloudy little bit", icon: ""))
                                    self.models.append(Weather(id: 55, main: " Clear", description: "Its very good environment", icon: ""))
                                    self.models.append(Weather(id: 44, main: "Rain", description: "Rainy little bit", icon: ""))
                                    self.models.append(Weather(id: 33, main: "Cloud", description: "Cloudy little bit", icon: ""))
                                    self.models.append(Weather(id: 22, main: " Clear", description: "Its very good environment", icon: ""))
                                    self.models.append(Weather(id: 11, main: "Rain", description: "Rainy little bit", icon: ""))
                                    self.models.append(Weather(id: 00, main: "Cloud", description: "Cloudy little bit", icon: ""))
                                    self.models.append(Weather(id: 12, main: " Clear", description: "Its very good environment", icon: ""))
                                    DispatchQueue.main.async {
                                                                          self.table.reloadData()
                                                                      }
                                  
                                    
                                }
                                catch{
                                    print("error in fetching data \(error.localizedDescription)")
                                }
                            }
                        }
                        ).resume()

            

            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
       
        table.register(weather_Cell.nib(), forCellReuseIdentifier: weather_Cell.idnetifier)
        setuplocation()
        print("\(models)")
        
        // Do any additional setup after loading the view.
    }


}

