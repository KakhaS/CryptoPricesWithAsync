//
//  ContentView.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 09.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ContentViewModel())
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coinItem in
                    NavigationLink {
                        VStack {
                            CoinDetailedView(coin: coinItem)
                        }
                        
                    } label: {
                        CoinRowView(coin: coinItem)
                    }
                    
                    
                }
            }.navigationTitle("LIVE")
                .overlay {
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    ContentView()
}
