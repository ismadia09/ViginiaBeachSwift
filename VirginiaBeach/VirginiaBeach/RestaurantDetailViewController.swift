//
//  RestaurantDetailViewController.swift
//  VirginiaBeach
//
//  Created by Isma Dia on 17/12/2017.
//  Copyright © 2017 Mobyview. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController {
    
    var restaurant : Restaurant?

    @IBOutlet weak var titreRestoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem?.image = UIImage(cgImage: #imageLiteral(resourceName: "back-icon").cgImage!)
        titreRestoLabel.text = restaurant?.name
        descriptionLabel.text = restaurant?.descrption
        locationLabel.text = restaurant?.locationArea
        addressLabel.text = restaurant?.address
    }


}
