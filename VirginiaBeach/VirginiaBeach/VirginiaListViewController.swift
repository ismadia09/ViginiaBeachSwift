//
//  VirginiaListViewController.swift
//  VirginiaBeach
//
//  Created by Isma Dia on 17/12/2017.
//  Copyright © 2017 Mobyview. All rights reserved.
//

import UIKit
import FirebaseAuth

class VirginiaListViewController: UIViewController {

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var sideBarLeftConstraint: NSLayoutConstraint!
    
    var isSideBarHidden = true
    
    let restaurantCellId = "restaurantCellId"
    let attractionCellId = "attractionCellId"
    
    @IBOutlet weak var virginiaBeachListTableView: UITableView!
    
    var virginiaList : [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        virginiaBeachListTableView.delegate = self
        virginiaBeachListTableView.dataSource = self

        mailLabel.text = Auth.auth().currentUser?.email
        sideBarLeftConstraint.constant = -300
        
        //let navigationBar = UINavigationBar.appearance()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(sideMenu))
        
        
        let restaurantCellNibName = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        let attractionCellNibName = UINib(nibName: "AttractionTableViewCell", bundle: nil)
        virginiaBeachListTableView.register(restaurantCellNibName, forCellReuseIdentifier: restaurantCellId)
        virginiaBeachListTableView.register(attractionCellNibName, forCellReuseIdentifier: attractionCellId)
        
        let restaurant = Restaurant(name: "Adam Thoroughgood House", image: "http://virginia.mobyview.eu/api/entity_file/183", locationArea: "Ocean Front", distance: "2 metres", description: "Test description", address: "1636 Parish Rd, Virginia Beach, VA 23455")
        virginiaList.append(restaurant)
        let restaurant1 = Restaurant(name: "Adventure Parasail", image: "http://virginia.mobyview.eu/api/entity_file/183", locationArea: "Ocean Front", distance: "3 metres", description: "Test description", address: "300 Winston Salem Avenue Virginia Beach, VA 23451")
        virginiaList.append(restaurant1)
        let restaurant2 = Restaurant(name: "Adventure Park at Virginia Aquarium", image: "http://virginia.mobyview.eu/api/entity_file/183", locationArea: "Ocean Front", distance: "4 metres", description: "Test description", address: "801 General Booth Boulevard Virginia Beach, Virginia 23451 ")
        virginiaList.append(restaurant2)
        
        
    }
    
    @objc func sideMenu () {
        
        if isSideBarHidden {
            sideBarLeftConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            isSideBarHidden = !isSideBarHidden
        }else {
            sideBarLeftConstraint.constant = -300
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            isSideBarHidden = !isSideBarHidden
        }
        
    
    }

 
    @IBAction func signOutAction(_ sender: Any) {
        
       try? Auth.auth().signOut()
        present(MainViewController(), animated: true, completion: nil)
    }
}


extension VirginiaListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return virginiaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = virginiaBeachListTableView.dequeueReusableCell(withIdentifier: attractionCellId) as! AttractionTableViewCell
        
        if indexPath.row % 2 == 0 {
            
            let cell = virginiaBeachListTableView.dequeueReusableCell(withIdentifier: restaurantCellId) as! RestaurantTableViewCell
            let restaurant = virginiaList[indexPath.row] as! Restaurant
            cell.restaurantName.text = restaurant.name
            cell.restaurantLocationArea.text = restaurant.locationArea
            cell.restaurantDistance.text = restaurant.distance
            
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            
            return 95
        }
        return 129
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurantDetailViewController = RestaurantDetailViewController()
        restaurantDetailViewController.restaurant = virginiaList[indexPath.row] as? Restaurant
        navigationController?.pushViewController(restaurantDetailViewController, animated: true)
    }
    
    
}
