//
//  adVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/28/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit

class adVC: UIViewController {
   

    var scrollView: UIScrollView = {
        let screenSize: CGRect = UIScreen.main.bounds
        let view = UIScrollView(frame: CGRect(x: 0, y: 100, width: screenSize.width, height: 1332))
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.main.bounds
        
        
        

            let closeButton = UIButton(frame: CGRect(x: 40, y: 50, width: 50, height: 50))
            closeButton.setImage(UIImage(named: "close"), for: .normal)
            closeButton.backgroundColor = UIColor.white
            closeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(closeButton)

        
        let image = UIImage(named: "adImage")
        let imageView = UIImageView(image: image!)
        imageView.isUserInteractionEnabled = true
        
        imageView.frame = CGRect(x: 0, y: 50, width: screenSize.width, height: 1332)
        
        
        imageView.contentMode = .scaleAspectFill

        
      
        
        scrollView.contentSize = CGSize(width: screenSize.width, height: 2000)

        view.addSubview(scrollView)
        view.sendSubviewToBack(scrollView)
        scrollView.addSubview(imageView)

        
        
        
    }
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        self.dismiss(animated: true, completion: nil)

        
    }





}
