//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rajeshwari on 12/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl1: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func onTap(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let defaults = UserDefaults.standard
            let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
            let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
            let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
            
            if (rate1 != "") {
                
                self.tipControl1.setTitle(rate1, forSegmentAt: 0)
            }
            if (rate2 != "") {
                self.tipControl1.setTitle(rate2, forSegmentAt: 1)
            }
            
            if (rate3 != "") {
                self.tipControl1.setTitle(rate3, forSegmentAt: 2)
            }
            calculateTip(animated as AnyObject)
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults=UserDefaults.standard
        
        let billAmount = self.billAmountTextField.text?.replacingOccurrences(of: "$", with: "")
        let bill = Double(billAmount!) ?? 0
        
        
        var tipPercentage = String(self.tipControl1.titleForSegment(at: self.tipControl1.selectedSegmentIndex)!) 
        tipPercentage = tipPercentage.replacingOccurrences(of: "%", with: "")
        let tipPercent = Double(tipPercentage) ?? 0
        let tipAmount:Double = Double((bill * tipPercent)/100)
        let total = tipAmount + bill
        tipPercentageLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)

    }
}

