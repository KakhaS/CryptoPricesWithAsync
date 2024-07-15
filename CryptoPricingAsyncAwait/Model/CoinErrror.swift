//
//  CoinErrror.swift
//  CryptoPricingAsyncAwait
//
//  Created by Kakha Sepashvili on 09.07.24.
//

import Foundation

enum CoinError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unkown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL Not found"
        case .serverError:
            return "Server Error"
        case .invalidData:
            return "Data is invalid."
        case .unkown(let error):
            return error.localizedDescription
        }
    }
}
