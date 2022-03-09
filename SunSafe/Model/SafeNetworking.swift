//
//  SafeNetworking.swift
//  SunSafe
//
//  Created by SINDHYA ANOOP on 1/28/22.
//

import Foundation
import CoreLocation

protocol SafeNetworkingDelegate {
    func didUpdateLabels(safeNetwork:SafeNetworking, safeCondition:SafeConditions)
}

struct SafeNetworking{
    var delegate : SafeNetworkingDelegate?
    let uvUrl = "https://api.weatherbit.io/v2.0/current?&key=f42ce4256b3b49808bc4ee01c7ade833"
    
    func getURLString(city:String){
        let urlString = "\(uvUrl)&city=\(city)"
        performNetworking(with: urlString)
    }
    func getURLString(lat:CLLocationDegrees,lon:CLLocationDegrees){
        let urlString = "\(uvUrl)&lat=\(lat)&lon=\(lon)"
        print (urlString)
        performNetworking(with: urlString)
    }
    
    
    func performNetworking(with urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let safeModel = self.parseJSON(uvData:safeData){
                        self.delegate?.didUpdateLabels(safeNetwork:self, safeCondition:safeModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(uvData:Data)->SafeConditions? {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(UvData.self, from: uvData)
            let safeValue = decodedData.data[0].uv
            let safeModel = SafeConditions(uvNum: safeValue)
            return safeModel
        }
        catch{
            print(error)
            return nil
        }
    }
}

