//
//  MainVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
// 은경 뷰

import UIKit

class MainVC: UIViewController {
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    let button5 = UIButton()
    
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let button10 = UIButton()
    
    let button11 = UIButton()
    
    let button12 = UIButton()
    //// 요기요 디폴트 홈page
    @IBOutlet var scrollView: UIScrollView!
    //don't delete! menu toggle
    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        settingview()
        
    }
    @objc func foodButtonDidTap(){
        performSegue(withIdentifier: "showclass", sender: nil)
    }
    

    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
    }
    func settingview(){
        scrollView.contentSize = CGSize(width: 375, height: 1000)
        var images = [
            "food1",
            "food2",
            "food3",
            "food4",
            "food5",
            "food6",
            "food7",
            "food8",
            "food9",
            "food10",
            "food11",
            "food12"]
        
        let scrollAdView = UIScrollView()
        let scrollMidAdView = UIScrollView()
        let lastImage = UIImageView()
        
        
        var buttons = [ button1,button2,button3,button4,button5,button6,button7,button8,button9,button10
            ,button11,button12
        ]
        
        for index in buttons {
            index.translatesAutoresizingMaskIntoConstraints = false
            
            scrollView.addSubview(index)
        }
        scrollAdView.contentSize = CGSize(width: 375 * 3, height: 100)
        scrollAdView.isScrollEnabled = true
        
        scrollMidAdView.contentSize = CGSize(width: 375 * 3, height: 100)
        scrollMidAdView.isScrollEnabled = true
        
        
        lastImage.image = UIImage(named: "cha")
        scrollView.addSubview(lastImage)
        lastImage.translatesAutoresizingMaskIntoConstraints = false
        lastImage.contentMode = .scaleAspectFit
        
        
        scrollView.addSubview(scrollAdView)
        scrollAdView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollMidAdView)
        scrollMidAdView.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0..<buttons.count{
            buttons[index].setImage(UIImage(named: images[index]), for: .normal)
        }
        
        scrollAdView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        scrollAdView.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor).isActive = true
        scrollAdView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scrollAdView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        scrollMidAdView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        scrollMidAdView.topAnchor.constraint(equalTo: button12.bottomAnchor).isActive = true
        scrollMidAdView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scrollMidAdView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        let imageview1 = UIImageView()
        let imageview2 = UIImageView()
        let imageview3 = UIImageView()
        
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview2.translatesAutoresizingMaskIntoConstraints = false
        imageview3.translatesAutoresizingMaskIntoConstraints = false
        
        imageview1.image = UIImage(named: "ad4")
        
        imageview2.image = UIImage(named: "ad5")
        imageview3.image = UIImage(named: "ad6")
        
        let imageview4 = UIImageView()
        let imageview5 = UIImageView()
        let imageview6 = UIImageView()
        
        imageview4.translatesAutoresizingMaskIntoConstraints = false
        imageview5.translatesAutoresizingMaskIntoConstraints = false
        imageview6.translatesAutoresizingMaskIntoConstraints = false
        
        imageview4.image = UIImage(named: "ad1")
        imageview5.image = UIImage(named: "ad2")
        imageview6.image = UIImage(named: "ad3")
        
        scrollAdView.addSubview(imageview1)
        scrollAdView.addSubview(imageview2)
        scrollAdView.addSubview(imageview3)
        
        
        
        imageview1.leadingAnchor.constraint(equalTo: scrollAdView.leadingAnchor).isActive = true
        imageview1.topAnchor.constraint(equalTo: scrollAdView.topAnchor).isActive = true
        imageview1.bottomAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        
        imageview2.leadingAnchor.constraint(equalTo: imageview1.trailingAnchor).isActive = true
        imageview2.topAnchor.constraint(equalTo: scrollAdView.topAnchor).isActive = true
        imageview2.bottomAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        
        imageview3.leadingAnchor.constraint(equalTo: imageview2.trailingAnchor).isActive = true
        imageview3.topAnchor.constraint(equalTo: scrollAdView.topAnchor).isActive = true
        imageview3.bottomAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        imageview3.trailingAnchor.constraint(equalTo: scrollAdView.trailingAnchor).isActive = true
        
        
        scrollMidAdView.addSubview(imageview4)
        scrollMidAdView.addSubview(imageview5)
        scrollMidAdView.addSubview(imageview6)
        
        imageview4.leadingAnchor.constraint(equalTo: scrollMidAdView.contentLayoutGuide.leadingAnchor).isActive = true
        imageview4.topAnchor.constraint(equalTo: scrollMidAdView.contentLayoutGuide.topAnchor).isActive = true
        imageview4.bottomAnchor.constraint(equalTo: scrollMidAdView.bottomAnchor).isActive = true
        
        imageview5.leadingAnchor.constraint(equalTo: imageview4.trailingAnchor).isActive = true
        imageview5.topAnchor.constraint(equalTo: scrollMidAdView.contentLayoutGuide.topAnchor).isActive = true
        imageview5.bottomAnchor.constraint(equalTo: scrollMidAdView.bottomAnchor).isActive = true
        
        imageview6.leadingAnchor.constraint(equalTo: imageview5.trailingAnchor).isActive = true
        imageview6.topAnchor.constraint(equalTo: scrollMidAdView.contentLayoutGuide.topAnchor).isActive = true
        imageview6.bottomAnchor.constraint(equalTo: scrollMidAdView.bottomAnchor).isActive = true
        imageview6.trailingAnchor.constraint(equalTo: scrollMidAdView.contentLayoutGuide.trailingAnchor).isActive = true
        
        
        button1.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        button1.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        button2.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: scrollAdView.bottomAnchor).isActive = true
        button3.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button4.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        button4.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true
        button4.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button4.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor).isActive = true
        button5.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true
        button5.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button5.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button6.leadingAnchor.constraint(equalTo: button5.trailingAnchor).isActive = true
        button6.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true
        button6.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button6.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button7.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        button7.topAnchor.constraint(equalTo: button4.bottomAnchor).isActive = true
        button7.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button7.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button8.leadingAnchor.constraint(equalTo: button7.trailingAnchor).isActive = true
        button8.topAnchor.constraint(equalTo: button4.bottomAnchor).isActive = true
        button8.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button8.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button9.leadingAnchor.constraint(equalTo: button8.trailingAnchor).isActive = true
        button9.topAnchor.constraint(equalTo: button4.bottomAnchor).isActive = true
        button9.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button9.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button10.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        button10.topAnchor.constraint(equalTo: button9.bottomAnchor).isActive = true
        button10.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button10.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button11.leadingAnchor.constraint(equalTo: button10.trailingAnchor).isActive = true
        button11.topAnchor.constraint(equalTo: button9.bottomAnchor).isActive = true
        button11.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button11.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        button12.leadingAnchor.constraint(equalTo: button11.trailingAnchor).isActive = true
        button12.topAnchor.constraint(equalTo: button9.bottomAnchor).isActive = true
        button12.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1/3).isActive = true
        button12.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        lastImage.topAnchor.constraint(equalTo: scrollMidAdView.bottomAnchor).isActive = true
        lastImage.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        lastImage.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        
        
        for index in buttons {
            index.addTarget(self, action: #selector(foodButtonDidTap), for: .touchUpInside)
        }
        
    }

    
    
}
