//
//  detailviewcontroller.swift
//  api passing
//
//  Created by syeda manahil fatima on 03/08/2024.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    var airport: Airport?

    private let airportNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let airportDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(airportNameLabel)
        view.addSubview(airportDetailsLabel)

        let backgroundImageView = UIImageView()

                // Set the image for the UIImageView
                backgroundImageView.image = UIImage(named: "detail") // Replace "yourImageName" with the name of your image asset

                // Set the content mode to scale the image appropriately
                backgroundImageView.contentMode = .scaleAspectFill

                // Disable autoresizing mask translation into constraints
                backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

                // Add the UIImageView to the view hierarchy
                view.addSubview(backgroundImageView)

                // Send the UIImageView to the back
                view.sendSubviewToBack(backgroundImageView)

                // Add constraints to make the UIImageView cover the entire view
                NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            airportNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            airportNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            airportNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            airportDetailsLabel.topAnchor.constraint(equalTo: airportNameLabel.bottomAnchor, constant: 16),
            airportDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            airportDetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        if let airport = airport {
            airportNameLabel.text = airport.name
            airportDetailsLabel.text = """
            Code: \(airport.code)
            City: \(airport.city)
            Country: \(airport.country)
            Timezone: \(airport.timezone)
            Location: \(airport.location.latitude), \(airport.location.longitude)
            Contact Info: \(airport.contactInfo.phone), \(airport.contactInfo.email), \(airport.contactInfo.website)
            """
        }
    }
}
