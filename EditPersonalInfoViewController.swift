//
//  EditPersonalInfoViewController.swift
//  Two
//
//  Created by Dhruv J on 5/25/19.
//  Copyright © 2019 Dhruv & Pranav. All rights reserved.
//

import UIKit

var userPhoneNumber: String?

class EditPersonalInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var EditAge: UITextField!
    @IBOutlet weak var EditSex: UITextField!
    @IBOutlet weak var EditWeight: UITextField!
    @IBOutlet weak var EditHeight: UITextField!
    @IBOutlet weak var EditPhoneNumber: UITextField!
    @IBOutlet weak var EditFullName: UITextField!
    
    var selectedAge: String?
    var selectedSex: String?
    var selectedHeight: String?
    var selectedWeight: String?
    
    
    let ages = ["18", "19", "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31", "32", "33", "34", "35", "36", "37", "38", "39", "40","41", "42", "43", "44", "45", "46", "47", "48", "49", "50","51", "52", "53", "54", "55", "56", "57", "58", "59", "60","61", "62", "63", "64", "65", "66", "67", "68", "69", "70","71", "72", "73", "74", "75", "76", "77", "78", "79", "80","81", "82", "83", "84", "85", "86", "87", "88", "89", "90","91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", ]
    
    let sexes = ["Male", "Female"]
    
    let heights = ["3' 1", "3' 2", "3' 3", "3' 4", "3' 5", "3' 6", "3' 7", "3' 8", "3' 9", "3' 10", "3' 11", "4' 0", "4' 1", "4' 2", "4' 3", "4' 4", "4' 5", "4' 6", "4' 7", "4' 8", "4' 9", "4' 10", "4' 11", "5' 0", "5' 1", "5' 2", "5' 3", "5' 4", "5' 5", "5' 6", "5' 7", "5' 8", "5' 9", "5' 10", "5' 11", "6' 0", "6' 1", "6' 2", "6' 3", "6' 4", "6' 5", "6' 6", "6' 7", "6' 8", "6' 9", "6' 10", "6' 11", "7' 0", "7' 1", "7' 2", "7' 3", "7' 4", "7' 5", "7' 6", "7' 7", "7' 8", "7' 9", "7' 10", "7' 11"]
    
    let weights = ["50lbs", "51lbs", "52lbs", "53lbs", "54lbs", "55lbs", "56lbs", "57lbs", "58lbs", "59lbs", "60lbs", "61lbs", "62lbs", "63lbs", "64lbs", "65lbs", "66lbs", "67lbs", "68lbs", "69lbs", "70lbs", "71lbs", "72lbs", "73lbs", "74lbs", "75lbs", "76lbs", "77lbs", "78lbs", "79lbs", "80lbs", "81lbs", "82lbs", "83lbs", "84lbs", "85lbs", "86lbs", "87lbs", "88lbs", "89lbs", "90lbs", "91lbs", "92lbs", "93lbs", "94lbs", "95lbs", "96lbs", "97lbs", "98lbs", "99lbs", "100lbs", "101lbs", "102lbs", "103lbs", "104lbs", "105lbs", "106lbs", "107lbs", "108lbs", "109lbs", "110lbs", "111lbs", "112lbs", "113lbs", "114lbs", "115lbs", "116lbs", "117lbs", "118lbs", "119lbs", "120lbs", "121lbs", "122lbs", "123lbs", "124lbs", "125lbs", "126lbs", "127lbs", "128lbs", "129lbs", "130lbs", "131lbs", "132lbs", "133lbs", "134lbs", "135lbs", "136lbs", "137lbs", "138lbs", "139lbs", "140lbs", "141lbs", "142lbs", "143lbs", "144lbs", "145lbs", "146lbs", "147lbs", "148lbs", "149lbs", "150lbs", "151lbs", "152lbs", "153lbs", "154lbs", "155lbs", "156lbs", "157lbs", "158lbs", "159lbs", "160lbs", "161lbs", "162lbs", "163lbs", "164lbs", "165lbs", "166lbs", "167lbs", "168lbs", "169lbs", "170lbs", "171lbs", "172lbs", "173lbs", "174lbs", "175lbs", "176lbs", "177lbs", "178lbs", "179lbs", "180lbs", "181lbs", "182lbs", "183lbs", "184lbs", "185lbs", "186lbs", "187lbs", "188lbs", "189lbs", "190lbs", "191lbs", "192lbs", "193lbs", "194lbs", "195lbs", "196lbs", "197lbs", "198lbs", "199lbs", "200lbs", "201lbs", "202lbs", "203lbs", "204lbs", "205lbs", "206lbs", "207lbs", "208lbs", "209lbs", "210lbs", "211lbs", "212lbs", "213lbs", "214lbs", "215lbs", "216lbs", "217lbs", "218lbs", "219lbs", "220lbs", "221lbs", "222lbs", "223lbs", "224lbs", "225lbs", "226lbs", "227lbs", "228lbs", "229lbs", "230lbs", "231lbs", "232lbs", "233lbs", "234lbs", "235lbs", "236lbs", "237lbs", "238lbs", "239lbs", "240lbs", "241lbs", "242lbs", "243lbs", "244lbs", "245lbs", "246lbs", "247lbs", "248lbs", "249lbs", "250lbs", "251lbs", "252lbs", "253lbs", "254lbs", "255lbs", "256lbs", "257lbs", "258lbs", "259lbs", "260lbs", "261lbs", "262lbs", "263lbs", "264lbs", "265lbs", "266lbs", "267lbs", "268lbs", "269lbs", "270lbs", "271lbs", "272lbs", "273lbs", "274lbs", "275lbs", "276lbs", "277lbs", "278lbs", "279lbs", "280lbs", "281lbs", "282lbs", "283lbs", "284lbs", "285lbs", "286lbs", "287lbs", "288lbs", "289lbs", "290lbs", "291lbs", "292lbs", "293lbs", "294lbs", "295lbs", "296lbs", "297lbs", "298lbs", "299lbs", "300lbs"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (EditAge.isFirstResponder){
            return ages.count
        } else if(EditSex.isFirstResponder){
            return sexes.count
        } else if(EditWeight.isFirstResponder){
            return weights.count
        }else {
            return heights.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent components: Int) -> String? {
        if(EditAge.isFirstResponder){
            return ages[row]
        }
        if(EditSex.isFirstResponder){
            return sexes[row]
        }
        if(EditWeight.isFirstResponder){
            return weights[row]
        }
        if(EditHeight.isFirstResponder){
            return heights[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(EditAge.isFirstResponder){
            selectedAge = ages[row]
            EditAge.text = selectedAge
        }  else if(EditSex.isFirstResponder){
            selectedSex = sexes[row]
            EditSex.text = selectedSex
        }  else if(EditWeight.isFirstResponder){
            selectedWeight = weights[row]
            EditWeight.text = selectedWeight
        }  else if(EditHeight.isFirstResponder){
            selectedHeight = heights[row]
            EditHeight.text = selectedHeight
        }
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        EditAge.inputView = pickerView
        
        EditSex.inputView = pickerView
        
        EditHeight.inputView = pickerView
        
        EditWeight.inputView = pickerView
        
    }
    
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        EditSex.inputAccessoryView = toolBar
        
        EditAge.inputAccessoryView = toolBar
        
        EditHeight.inputAccessoryView = toolBar
        
        EditWeight.inputAccessoryView = toolBar
        
        
    }
    
    @objc func dismissKeyboard(){
        
        view.endEditing(true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
createPickerView()
        dismissPickerView()
        // Do any additional setup after loading the view.
        EditAge.text = userAge
        EditHeight.text = userHeight
        EditSex.text = userSex
        EditFullName.text = userFullName
        EditPhoneNumber.text = userPhoneNumber
        EditWeight.text = userWeight
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        userAge = String(EditAge.text!)
        userHeight = String(EditHeight.text!)
        userSex = String(EditSex.text!)
        userWeight = String(EditWeight.text!)
        userPhoneNumber = String(EditPhoneNumber.text!)
        userFullName = String(EditFullName.text!)
        
        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "ProfileViewController") as! ProfileViewController
        
        self.present(profileViewController, animated: true)
        
        
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
