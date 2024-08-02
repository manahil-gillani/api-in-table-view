//
//  ViewController.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
private let repository = airportRepository()
    private var airports: [Airport] = []
    
   let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(customcell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120

        fetchingAPIData()
        }
    
  private func fetchingAPIData(){
      repository.getAirport{
          [weak self] result in DispatchQueue.main.async {
              switch result{
              case.success(let airports):
                  self?.airports = airports
                  print("fetched airports data: \(airports)")
                 // self?.tableView.reloadData()
              case.failure(let error):
                  print("error fetching airport details: \(error.localizedDescription)")
              }
          }
      }
   }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = airports.count
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customcell
        //else{fatalError("unable to deque cell with identifier")}
        let airport = airports[indexPath.row]
      //  cell.id = airport.id
        cell.airportname.text = airport.name
        cell.code.text = airport.code
        cell.city.text = airport.city
        cell.country.text = airport.country
        cell.timezone.text = airport.timezone
        return cell
    }
}
