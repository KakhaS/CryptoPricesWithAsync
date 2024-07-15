//
//  CoinDetailedView.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 15.07.24.
//

import SwiftUI

struct CoinDetailedView: View {
    let coin: CoinViewData
    var body: some View {
        Text(isInvestingGoodIdeaWithText(coinName: coin.name, coinChange: coin.changePercent))
//            .font(.title)x
            .bold()
            .frame(width: 300, height: 650)
            .multilineTextAlignment(.center)
    }
    
    
    
    func isInvestingGoodIdeaWithText(coinName: String, coinChange: String) -> String {
        var text = ""
        let newFormat = coinChange.replacingOccurrences(of: "%", with: "")
        let finalnumber = Double(newFormat) ?? 0
        if finalnumber >= 0 {
            text =  "Hey ! I think it is a good idea to invest in \(coinName) "       } else {
                text =  "\(coinName) sucked today. \(coinChange) is declining percent"
            }
        return text
    }
}




#Preview {
    CoinDetailedView(coin: CoinViewData.sample)
}
