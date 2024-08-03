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
    var activityIndicator = UIActivityIndicatorView()
    var position = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        
        super.view.backgroundColor = UIColor.blue
        
        setupActivityIndicator()
        showLoading(true)
        
        tableView.frame = CGRect(x: 20, y:250, width: 400, height: 600)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(customcell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120
        tableView.backgroundColor = .clear

        let headingLabel = UILabel()
                headingLabel.text = "AIRPORTS"
                headingLabel.textColor = .white
                headingLabel.font = UIFont.systemFont(ofSize: 38, weight: .bold)
                //headingLabel.textAlignment = .center
        headingLabel.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
                headingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headingLabel)
        
        let backgroundImageView = UIImageView()

                // Set the image for the UIImageView
                backgroundImageView.image = UIImage(named: "tableview")
                backgroundImageView.contentMode = .scaleAspectFill
                backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

                // Add the UIImageView to the view hierarchy
                view.addSubview(backgroundImageView)

                // Send the UIImageView to the back
                view.sendSubviewToBack(backgroundImageView)

        NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
                ])
    
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
                 // self?.tableView.reloadData()
              case.failure(let error):
                  print("error fetching airport details: \(error.localizedDescription)")
              }
              self?.showLoading(false)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let detailVC = DetailViewController()
            detailVC.airport = airports[indexPath.row]
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    
    private func setupActivityIndicator() {
                activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
                self.view.addSubview(activityIndicator)
            }
    
    private func showLoading(_ show: Bool) {
                if show {
                    activityIndicator.startAnimating()
                } else {
                    activityIndicator.stopAnimating()
                }
            }
    
    private func printAirports(){
        for airport in airports {
            print("ID: \(airport.id)")
            print("Name: \(airport.name)")
            
            
            print("Code: \(airport.code)")
            print("City: \(airport.city)")
            print("Country: \(airport.country)")
            print("Timezone: \(airport.timezone)")
        }
    }
    
}
