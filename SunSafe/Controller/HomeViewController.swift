//
//  ViewController.swift
//  SunSafe
//
//  Created by SINDHYA ANOOP on 1/28/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController,UITextFieldDelegate,SafeNetworkingDelegate,CLLocationManagerDelegate{
    func didUpdateLabels(safeNetwork: SafeNetworking, safeCondition: SafeConditions) {
        DispatchQueue.main.async {
            self.level.text = String(safeCondition.uvNum)
            self.backColor.backgroundColor = safeCondition.uvColor
            self.value.text = safeCondition.uvName
            self.details.text = safeCondition.uvDescription
        }
        
    }
    
    
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var backColor: UIView!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var location: UIButton!
    
    var dataNetwork = SafeNetworking()
    
    @IBOutlet weak var searchText: UITextField!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.delegate = self
        dataNetwork.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
       
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchText.endEditing(true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locations = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = locations.coordinate.latitude
            let lon = locations.coordinate.longitude
        dataNetwork.getURLString(lat: lat, lon: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchText.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = searchText.text {
            dataNetwork.getURLString(city: cityName)
        }
        searchText.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchText.text == "" {
            searchText.placeholder = "Enter a City Name"
            return false
        }else{
            return true
        }
    }
}


