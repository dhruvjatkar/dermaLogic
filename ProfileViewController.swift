//
//  ProfileViewController.swift
//  Two
//
//  Created by Dhruv J on 5/24/19.
//  Copyright © 2019 Dhruv & Pranav. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var firstInitial: UILabel!
    @IBOutlet weak var LastInitial: UILabel!
    @IBOutlet weak var AgeText: UILabel!
    @IBOutlet weak var profName: UILabel!
    @IBOutlet weak var profAge: UILabel!
    @IBOutlet weak var profSex: UILabel!
    @IBOutlet weak var profWeight: UILabel!
    @IBOutlet weak var profHeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
        firstInitial.text = userInitialF
        LastInitial.text = userInitialL
        profName.text = userName
        profAge.text = userAge
        profWeight.text = userWeight
        profHeight.text = userHeight
        profName.text = userFullName
        
        
        
        }
    

    @IBAction func goToCamera(_ sender: Any) {
        let camViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "ViewController") as! ViewController
        
        self.present(camViewController, animated: true)
    }
    
    @IBAction func EditPersonalInfo(_ sender: Any) {
        let editViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "EditPersonalInfoViewController") as! EditPersonalInfoViewController
        
        self.present(editViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
