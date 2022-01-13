//
//  RestaurantTableViewCell2.swift
//  YelpyMari
//
//  Created by Mari Batilando on 1/12/22.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {
  
  static let cellIdentifier = "RestaurantTableViewCell"
  
  @IBOutlet weak var restaurantImageView: UIImageView!
  @IBOutlet weak var restaurantNameLabel: UILabel!
  @IBOutlet weak var restaurantTypeLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var phoneNumberLabel: UILabel!
  
  func configure(with restaurant: Restaurant) {
    restaurantNameLabel.text = restaurant.name
    restaurantTypeLabel.text = restaurant.type
    ratingLabel.text = "Rating: \(String(restaurant.rating))"
    phoneNumberLabel.text = restaurant.phoneNumber
    restaurantImageView.af.setImage(withURL: URL(string: restaurant.imageURL)!)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    restaurantNameLabel.text?.removeAll()
    restaurantTypeLabel.text?.removeAll()
    ratingLabel.text?.removeAll()
    phoneNumberLabel.text?.removeAll()
    restaurantImageView.image = nil
  }
}
