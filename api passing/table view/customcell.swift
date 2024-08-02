//
//  customcell.swift
//  api passing
//
//  Created by syeda manahil fatima on 02/08/2024.
//

import Foundation
import SwiftUI

class customcell: UITableViewCell {
    let id = UILabel()
let airportname = UILabel()
    let code = UILabel()
    let city = UILabel()
    let country = UILabel()
    let timezone = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(id)
        
        id.frame=CGRect(x: 70, y: -25, width: 150, height: 100)
        addSubview(airportname)
        airportname.frame=CGRect(x: 70, y: -15, width: 150, height: 100)
        addSubview(code)
        addSubview(city)
        addSubview(country)
        addSubview(timezone)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
