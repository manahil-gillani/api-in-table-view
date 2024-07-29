//
//  ViewController.swift
//  api passing
//
//  Created by syeda manahil fatima on 28/07/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
private let repository = airportRepository()
    private var airports: [Airport] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        fetchingAPIData()
        }
    
  private func fetchingAPIData(){
      repository.getAirport{
          [weak self] result in DispatchQueue.main.async {
              switch result{
              case.success(let airports):
                  self?.airports = airports
                  print("fetched airports data: \(airports)")
                  self?.tableView.reloadData()
              case.failure(let error):
                  print("error fetching airport details: \(error.localizedDescription)")
              }
          }
      }
   }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = airports.count
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
            fatalError("unable to deque cell with identifier")
        }
        let airport = airports[indexPath.row]
        cell.textLabel?.text = airport.name
        return cell
    }
}
