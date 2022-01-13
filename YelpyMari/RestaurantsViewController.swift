//
//  ViewController.swift
//  YelpyMari
//
//  Created by Mari Batilando on 1/12/22.
//

import UIKit

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  private var restaurants = [Restaurant]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableView.automaticDimension
    RestaurantService.shared.fetchRestaurants { restaurants in
      self.restaurants = restaurants
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurants.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.cellIdentifier) as? RestaurantTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(with: restaurants[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

