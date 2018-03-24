//
//  CustomizationViewController.swift
//  Minkura
//
//  Created by Mathew Mozaffari on 2018-03-25.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class CustomizationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, PayPalPaymentDelegate {
       
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    var payPalConfig = PayPalConfiguration() // default

    @IBAction func payPressed(_ sender: Any) {
        let item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "0.95"), withCurrency: "USD", withSku: "Hip-0037")
        let item2 = PayPalItem(name: "Free rainbow patch", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00066")
        let item3 = PayPalItem(name: "Long-sleeve plaid shirt (mustache not included)", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00291")
        
        let items = [item1, item2, item3]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "0.00")
        let tax = NSDecimalNumber(string: "0.00")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Minikuru Customization", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self as! PayPalPaymentDelegate)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            print("Payment not processalbe: \(payment)")
        }
        
    }
    
        
        
        
       /*
        func organizationPicker(_ organizationPicker: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let titleData = organizing[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
            return myTitle
        }
        */
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Set up payPalConfig
            payPalConfig.acceptCreditCards = false
            payPalConfig.merchantName = "Minikura"
            payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
            payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
            payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
            payPalConfig.payPalShippingAddressOption = .both

        }
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PayPalMobile.preconnect(withEnvironment: environment)
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    @IBAction func closeOne(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeTwo(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeThree(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closeFour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
    //picker view
    
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var organizationPicker: UIPickerView!
    @IBOutlet weak var customizationStatus: UILabel!
    
    let addons = ["Sorting (ABC order)", "Labelling", "Scanning documents"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addons[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addons.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        organizationLabel.text = addons[row]
        customizationStatus.text = "Customization Enabled"
    }
  

}
