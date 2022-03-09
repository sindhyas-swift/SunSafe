//
//  SafeConditions.swift
//  SunSafe
//
//  Created by SINDHYA ANOOP on 1/28/22.
//

import Foundation
import UIKit

struct SafeConditions{
    var uvNum : Double
    var uvName : String {
        switch(uvNum){
        case 0...2:
            return "Low"
        case 3...5:
            return "Moderate"
        case 6...7:
            return "High"
        case 8...10:
            return "Extreme"
        case 11...:
            return "VeryHigh"
        default:
            return "Error"
        }
    }
    var uvDescription : String {
        switch(uvNum){
        case 0...2:
            return """
            You can safely enjoy being outside. Wear sunglasses on
            bright days. If you burn easily, cover up and use sunscreen
            SPF 30+
            In winter, reflection off snow can nearly double UV strength.
            """
        case 3...5:
            return """
            Take precautions if you will be outside, such as wearing a
            hat and sunglasses and using sunscreen SPF 30+. Reduce
            your exposure to the sun's most intense UV radiation by
            seeking shade during midday hours.
            """
        case 6...7:
            return """
            Protection against sun damage is needed. Wear a
            wide-brimmed hat and sunglasses, use sunscreen SPF 30+
            and wear a long-sleeved shirt and pants when practical.
            Reduce your exposure to the sun's most intense UV
            radiation by seeking shade during midday hours.
            """
        case 8...10:
            return """
            Protection against sun damage is needed. If you need to be
            outside during midday hours between 10 a.m. and 4 p.m.,
            take steps to reduce sun exposure. A shirt, hat and
            sunscreen are a must, and be sure you seek shade.
            Beachgoers should know that white sand and other bright
            surfaces reflect UV and can double UV exposure.
            """
        case 11...:
            return """
            Protection against sun damage is needed. If you need to be
            outside during midday hours between 10 a.m. and 4 p.m.,
            take steps to reduce sun exposure. A shirt, hat and
            sunscreen are a must, and be sure you seek shade.
            Beachgoers should know that white sand and other bright
            surfaces reflect UV and can double UV exposure.
            """
        default:
            return "Error"
        }
    }
    var uvColor:UIColor{
        switch(uvNum){
        case 0...2:
            return UIColor.green
        case 3...5:
            return UIColor.yellow
        case 6...7:
            return UIColor.orange
        case 8...10:
            return UIColor.red
        case 11...:
            return UIColor.purple
        default:
            return UIColor.white
        }
    }
}
