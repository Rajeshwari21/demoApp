//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Rajeshwari on 12/17/20.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var rate1textfield: UITextField!
    @IBOutlet weak var rate2textfield: UITextField!
    @IBOutlet weak var rate3textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
        if (rate1 != "") {
                self.rate1textfield.text=rate1
        }
        if (rate2 != "") {
            self.rate2textfield.text=rate2
        }
        if (rate3 != ""){
            self.rate3textfield.text=rate3
        }
    }
    
    @IBAction func submitRates(_ sender: Any) {
        let defaults=UserDefaults.standard
        var rate1Text:String=rate1textfield.text!
        var rate2Text:String=rate2textfield.text!
        var rate3Text:String=rate3textfield.text!
        
        // Set the rate1.
        rate1Text=rate1Text.replacingOccurrences(of:"%", with: "")
        defaults.set(rate1Text+"%", forKey: "rate1")
       
        //Set the rate2
        rate2Text=rate2Text.replacingOccurrences(of:"%", with: "")
        defaults.set(rate2Text+"%", forKey: "rate2")
        
        // set the rate3
        rate3Text=rate3Text.replacingOccurrences(of:"%", with: "")
        defaults.set(rate3Text+"%", forKey: "rate3")
        defaults.synchronize()
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
