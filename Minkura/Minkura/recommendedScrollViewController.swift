//
//  recommendedScrollViewController.swift
//  Minkura
//
//  Created by Mathew Mozaffari on 2018-03-24.
//  Copyright © 2018 Mathew Mozaffari. All rights reserved.
//

import UIKit

class recommendedScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var contentWidth:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // scrollView.delegate = self
       /*
        for image in 0...2 {
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 50, y: (view.frame.height / 2) + 50, width: 100, height: 100)
        } */
        

        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

