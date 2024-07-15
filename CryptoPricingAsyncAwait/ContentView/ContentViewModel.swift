//
//  ContentViewModel.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 09.07.24.
//

import Foundation


class ContentViewModel: ObservableObject {
    @Published var coins = [CoinViewData]()
    
    
    @Published var isLoading: Bool = false
    
    
    func onAppear() {
        isLoading = true
        loadData()
    }
    
    func transformData(_ coins: [Coin]) -> [CoinViewData] {
        var coinViewDataArray: [CoinViewData] = []
        
        coins.forEach { coin in
            let imageUrl = URL(string: coin.imageURL ?? "")
            let code = coin.code ?? "N/A"
            let name = coin.name ?? "N/A"
            let price = coin.price ?? "N/A"
            let change = coin.change ?? "N/A"
            let changePercent = coin.changePercent ?? "N/A"
            
            let coinViewData = CoinViewData(
                imageURL: imageUrl,
                code: code,
                name: name,
                price: price,
                change: change,
                changePercent: changePercent
            )
            
            coinViewDataArray.append(coinViewData)
        }
        
        return coinViewDataArray
    }
    
}


extension ContentViewModel {
    func fetchCryptoAsync() async throws {
        
        let myURL = "https://cryptocurrency-price-list-api.vercel.app"
        guard let URLString = URL(string: myURL) else { throw CoinError.invalidURL }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: URLString)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CoinError.serverError }
            let decoder = JSONDecoder()
            let decodedData =  try decoder.decode([Coin].self, from: data)
            
            Task { @MainActor in
                coins = transformData(decodedData)
                
                isLoading = false
            }
        } catch(let error) {
            print("error \(error)")
            
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await     fetchCryptoAsync()
        }
    }
}


