//
//  aqiData.swift
//  aqi
//
//  Created by Jack on 2018/12/5.
//  Copyright © 2018年 Jack. All rights reserved.
//

import Foundation

let AQI_URL = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

struct AQI: Codable{
    let SiteName:String?
    let County:String?
    let AQI:String?
    let PublishTime:String?
    
//    let aqi: String?
//    let cityName: String?
//    let stationName: String?
//    let updateTime: String?
    
}
