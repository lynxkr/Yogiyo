//
//  MainVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
// 은경 뷰

import UIKit


class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    @IBAction func onMoreTapped() {
        print("more tapped")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    var categoriesArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]
    
    
    var imagesArray: [String] = ["ad1", "ad2", "ad3"]
    
    let adCellId = "adCellId"
    let categoryCellId = "categoryCellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        setupViews()
        
    }
    
    
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AdCell.self, forCellWithReuseIdentifier: adCellId)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return categoriesArray.count
        }
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCell
            collectionView.cellForItem(at: indexPath)
            cell.categories = categoriesArray[indexPath.item]
            
            
            
            if indexPath.row == 0 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(one(_:))))
                
            } else if indexPath.row == 1 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(two(_:))))
                
            } else if indexPath.row == 2 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(three(_:))))
                
            } else if indexPath.row == 3 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(four(_:))))
                
            } else if indexPath.row == 4 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(five(_:))))
                
            } else if indexPath.row == 5 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(six(_:))))
                
            } else if indexPath.row == 6 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seven(_:))))
                
            } else if indexPath.row == 7 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eight(_:))))
                
            } else if indexPath.row == 8 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nine(_:))))
                
            } else if indexPath.row == 9 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ten(_:))))
                
            } else if indexPath.row == 10 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eleven(_:))))
                
            } else if indexPath.row == 11 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(twelve(_:))))
                
            } else if indexPath.row == 12 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thirteen(_:))))
                
            } else if indexPath.row == 13 {
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fourteen(_:))))
                
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adCellId, for: indexPath) as! AdCell
        //    cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.images = imagesArray
        return cell
        
    }
    
    @objc func all(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            print("Got clicked on index: \(indexPath?.row)")
        }
    }
    
    @objc func one(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("전체")
    }
    @objc func two(_ sender: UITapGestureRecognizer) {
        print("일인분 주문")
    }
    @objc func three(_ sender: UITapGestureRecognizer) {
        print("요기요 플러스")
    }
    @objc func four(_ sender: UITapGestureRecognizer) {
        print("치킨")
    }
    @objc func five(_ sender: UITapGestureRecognizer) {
        print("중국집")
    }
    @objc func six(_ sender: UITapGestureRecognizer) {
        print("피자/양식")
    }
    @objc func seven(_ sender: UITapGestureRecognizer) {
        print("한식")
    }
    @objc func eight(_ sender: UITapGestureRecognizer) {
        print("분식")
    }
    @objc func nine(_ sender: UITapGestureRecognizer) {
        print("카페/디저트")
    }
    @objc func ten(_ sender: UITapGestureRecognizer) {
        print("족발/보쌈")
    }
    @objc func eleven(_ sender: UITapGestureRecognizer) {
        print("일식/돈까스")
    }
    @objc func twelve(_ sender: UITapGestureRecognizer) {
        print("야식")
    }
    @objc func thirteen(_ sender: UITapGestureRecognizer) {
        print("프랜차이스")
    }
    @objc func fourteen(_ sender: UITapGestureRecognizer) {
        print("테이크아우")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    
    
}
