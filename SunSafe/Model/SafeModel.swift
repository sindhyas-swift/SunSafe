//
//  SafeModel.swift
//  SunSafe
//
//  Created by SINDHYA ANOOP on 1/28/22.
//

import Foundation

import UIKit

struct UvData:Decodable {
    let data : [DataUV]
}

struct DataUV : Decodable{
    let uv : Double
}
