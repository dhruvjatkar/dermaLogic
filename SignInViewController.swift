//
//  SignInViewController.swift
//  Two
//
//  Created by Dhruv J on 4/17/19.
//  Copyright © 2019 Dhruv & Pranav. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

        // Do any additional setup after loading the view.
    

    @IBAction func registerNewAccountButtonTapped(_ sender: Any) {
        print("Register new account button tapped")
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "RegisterUserViewController") as! RegisterUserViewController
        
        self.present(registerViewController, animated: true);
    
    }
    

    @IBAction func signinButtonTapped(_ sender: Any) {
            print("sign IN button tapped")
            if (userNameTextField.text?.isEmpty)! || (userPasswordTextField.text?.isEmpty)!
            {
                print("fields incomplete")
            } else {
                print("yay")
                /*
                let storyboard = UIStoryboard(name: "Camm", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as UIViewController
                
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.window?.rootViewController = storyboard
 
    }
    */
                
                let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
                    "ProfileViewController") as! ProfileViewController
                
                self.present(profileViewController, animated: true)
        
    }
    


}
}
