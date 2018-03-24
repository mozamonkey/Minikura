//
//  AnimationsViewController.swift
//  Minkura
//
//  Created by Mathew Mozaffari on 2018-03-24.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    @IBOutlet weak var uploadImages: UILabel!
    
    @IBOutlet weak var pickText: UILabel!
    @IBOutlet weak var minikura: UIImageView!
    @IBOutlet weak var deliverText: UILabel!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var notNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadImages.alpha = 0
        minikura.alpha = 0
        deliverText.alpha = 0
        pickText.alpha = 0
        beginButton.alpha = 0
        notNow.alpha = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.uploadImages.alpha = 0.6
        }) { (true) in
            showStepOne()
        }
        
        func showStepOne() {
            UIView.animate(withDuration: 1, animations: {
                self.uploadImages.alpha = 1
            }, completion: { (true) in
                showStepTwo()
            })
        }
        
        
        func showStepTwo() {
            UIView.animate(withDuration: 1, animations: {
                self.pickText.alpha = 1
                self.minikura.alpha = 1
            }, completion: { (true) in
                showStepThree()
            })
        }
        
        func showStepThree() {
            UIView.animate(withDuration: 1, animations: {
                self.deliverText.alpha = 1
            }, completion: { (true) in
                showBeginButton()
            })
        }
        
        func showBeginButton() {
            UIView.animate(withDuration: 1, animations: {
                self.beginButton.alpha = 1
            }, completion: { (true) in
                showNotNow()
            })
        }
        
        func showNotNow() {
            UIView.animate(withDuration: 1, animations: {
                self.beginButton.alpha = 1
                self.notNow.alpha = 1
            }, completion: { (true) in
            })
        }
    }

}
