//
//  CoinRowView.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 09.07.24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinViewData
    
    var body: some View {
        
        HStack {
            AsyncImage(url: coin.imageURL, content: { image in
                image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            })
            
            
            VStack(alignment: .leading) {
                Text(coin.name )
                    .font(.headline)
                    .foregroundColor(.black)
                Text("BTC")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            VStack{
                Text(coin.price )
                    .fontWeight(.semibold)
                Text(coin.changePercent)
                    .font(.caption)
                    .foregroundColor(percentageFormatter(coin.changePercent) >= 0 ? .green : .red )
                
            }
            
        }
        
        
    }
    func percentageFormatter(_ coin: String) -> Double{
        
        let newFormat = coin.replacingOccurrences(of: "%", with: "")
        let finalnumber = Double(newFormat) ?? 0
        
        return finalnumber
        
    }
}
#Preview {
    CoinRowView(coin: CoinViewData.sample)
}
