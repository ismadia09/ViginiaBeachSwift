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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        virginiaBeachListTableView.delegate = self
        virginiaBeachListTableView.dataSource = self

        mailLabel.text = Auth.auth().currentUser?.email
        sideBarLeftConstraint.constant = -300
        
        //let navigationBar = UINavigationBar.appearance()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.plain, target: self, action: #selector(sideMenu))
        
        
        let restaurantCellNibName = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        //let attractionCellNibName = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        virginiaBeachListTableView.register(restaurantCellNibName, forCellReuseIdentifier: restaurantCellId)
        
        
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = virginiaBeachListTableView.dequeueReusableCell(withIdentifier: restaurantCellId) as! RestaurantTableViewCell
        
        return cell
    }
    
    
}
