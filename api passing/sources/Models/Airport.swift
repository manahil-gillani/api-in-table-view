//
//  airport.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import Foundation

struct Gate: Codable {
    let gateNumber: String
    let airlines: [String]
    
    private enum CodingKeys: String, CodingKey {
        case gateNumber = "gate_number"
        case airlines
    }
}

struct Terminal: Codable {
    let name: String
    let gates: [Gate]
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
}

struct ContactInfo: Codable {
    let phone: String
    let email: String
    let website: String
}

struct Airport: Codable {
    let id: Int
    let name: String
    let code: String
    let location: Location
    let city: String
    let country: String
    let timezone: String
    let terminals: [Terminal]
    let airlines: [String]
    let services: [String]
    let contactInfo: ContactInfo
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case location
        case city
        case country
        case timezone
        case terminals
        case airlines
        case services
        case contactInfo = "contact_info"
    }
}

