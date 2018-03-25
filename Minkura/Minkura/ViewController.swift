//
//  ViewController.swift
//  Minkura
//
//  Created by Mathew Mozaffari on 2018-03-24.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var trackDisplay: UILabel!
    
    @IBAction func minikuraTapped(_ sender: Any) {
        if let url = URL(string: "http://minikura.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func searchTapped(_ sender: Any) {
        trackDisplay.text = "08:46:10 PM"
    }
    
    //picker view
    
    @IBOutlet weak var ratesLabel: UILabel!
    @IBOutlet weak var deliveryPicker: UIPickerView!
    @IBOutlet weak var finalTotal: UILabel!
    @IBOutlet weak var totalSum: UILabel!
    
    let delivery = ["Next Day Shipping (200¥)", "Two Day Shipping (100¥)", "Regular Shipping (Free)"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return delivery[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return delivery.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ratesLabel.text = delivery[row]
        finalTotal.text = "300¥"
        totalSum.text = "400¥"
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: delivery[row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributedString
    }

}

