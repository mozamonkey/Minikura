//
//  CustomSizeViewController.swift
//  Minkura
//
//  Created by Mathew Mozaffari on 2018-03-25.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class CustomSizeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var additionalCustomization: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //organization
    
    let organizing = ["Sorting (ABC order)", "Document Scanning", "Labelling & Sorting Items in different boxes"]
    
    func organizationPicker(_ organizationPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return organizing[row]
    }
    func organizationPicker(_ organizationPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return organizing.count
    }
    func organizationPicker(_ organizationPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        organizationLabel.text = organizing[row]
        additionalCustomization.text = "Customization Enabled"
        organizationLabel.text = "100¥ (one time organization fee)"
    }
    func organizationPicker(_ organizationPicker: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = organizing[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }

}
