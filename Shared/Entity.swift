//
//  Entity.swift
//  MVVMSample
//
//  Created by 김민섭 on 2022/06/26.
//

import Foundation

//    {"$id":"1","currentDateTime":"2022-06-26T05:27-04:00","utcOffset":"-04:00:00","isDayLightSavingsTime":true,"dayOfTheWeek":"Sunday","timeZoneName":"Eastern Standard Time","currentFileTime":133006948454200204,"ordinalDate":"2022-177","serviceResponse":null}
struct Entity: Codable {
    
    let id: String
    let currentDateTime: String
    let utcOffset: String
    let isDayLightSavingsTime: Bool
    let dayOfTheWeek: String
    let timeZoneName: String
    let currentFileTime: Int
    let ordinalDate: String
    let serviceResponse: String?

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case utcOffset
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}
