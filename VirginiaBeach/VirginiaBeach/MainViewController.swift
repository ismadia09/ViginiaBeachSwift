//
//  MainViewController.swift
//  VirginiaBeach
//
//  Created by Isma Dia on 16/12/2017.
//  Copyright © 2017 Mobyview. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self

        
    }

    
    @IBAction func loginAction(_ sender: Any) {
       
        guard let login = loginTextField.text ,
            let password =  passwordTextField.text  else{
                return
        }
            if segmentControl.selectedSegmentIndex == 0 {
                
                
                //Sign IN
                Auth.auth().signIn(withEmail: login, password: password , completion: { (user, err) in
                    
                    if user != nil {
                        
                        let alert = UIAlertController(title: "Connexion réussie", message: "La connexion a réussie", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        
                         self.present(UINavigationController(rootViewController : VirginiaListViewController()) , animated: true, completion: nil)
                        
                        self.present(alert, animated: true, completion: nil)
                        
                       
                        
                    }else{
                        
                        let alert = UIAlertController(title: "Erreur", message: "La connexion a échouée", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
                
            }else {
                
                //Sign UP
                Auth.auth().createUser(withEmail: login, password: password , completion: { (user, err) in
                    
                    if user != nil {
                        
                        let alert = UIAlertController(title: "Création du compte", message: "La création de compte a réussie", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        
                    }else{
                        
                        let alert = UIAlertController(title: "Erreur", message: "La création de compte a échouée", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
                
            }
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
       return true
    }
    

}



extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
