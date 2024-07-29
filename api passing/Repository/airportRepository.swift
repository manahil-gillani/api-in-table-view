//
//  airportRepository.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import Foundation

class airportRepository{
    private let apiClient = APIClient.shared
    
    func getAirport(completion: @escaping (Result<[Airport], Error>)-> Void){
        apiClient.fetchingAPIData(completion: completion)
    }
}
