//
//  ViewData.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 15.07.24.
//

import Foundation

struct CoinViewData: Identifiable, Hashable {
    var id = UUID()
    let imageURL: URL?
    let code: String
    let name: String
    let price: String
    let change: String
    let changePercent: String
}

extension CoinViewData {
    static var sample = CoinViewData( imageURL: nil, code: "BTC", name: "Bitcoin", price: "31.711", change: "", changePercent: "-12.313%")
}
