//
//  API endpoints.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import Foundation

enum APIEndpoints{
    static let baseURL = "https://freetestapi.com/api/v1/airports"
    
    case getAirport
    var url:URL{
        switch self{
        case .getAirport:
            return URL(string:APIEndpoints.baseURL)!
        }
    }
}
