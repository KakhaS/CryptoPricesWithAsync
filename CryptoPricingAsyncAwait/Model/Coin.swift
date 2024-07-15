//
//  Coin.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 09.07.24.
//

import Foundation

struct Coin:  Codable  {
    let imageURL: String?
    let code: String?
    let name: String?
    let price: String?
    let change: String?
    let changePercent: String?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case code, name, price, change
        case changePercent = "change_percent"
    }
}




