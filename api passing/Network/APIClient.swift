//
//  APIClient.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import Foundation

struct airportsresponse: Codable{
    let airports: [Airport]
}
class APIClient{
    static let shared = APIClient()
    private init(){}
    func fetchingAPIData(completion: @escaping (Result<[Airport], Error>)-> Void){
        let url = APIEndpoints.getAirport.url
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){data, response, error in if let error = error{
            completion(.failure(error))
            return
        }
            guard let data = data else{
                let error = NSError(domain: "com.example", code: 0, userInfo: [NSLocalizedDescriptionKey: "No Data received"])
                completion(.failure(error))
                return
            }
            do{
                print("here")
                let response = try JSONDecoder().decode([Airport].self, from: data)
                completion(.success(response))
                
            } catch{
                print("Error decoding JSON: \(error)")
                                print("Data: \(String(data: data, encoding: .utf8) ?? "No data")")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
