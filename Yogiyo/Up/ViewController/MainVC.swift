//
//  MainVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
// 은경 뷰

import UIKit

protocol SendViewDelegate {
    func sendView(data: Int)
}
class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    var delegate: SendViewDelegate?
    
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
    var imagesArray2: [String] = ["1", "2", "3", "4", "5", "6"]

    let adCellId = "adCellId"
    let categoryCellId = "categoryCellId"
    let popularCellId = "popularCellId"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        setupViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SettingData.shared.location != nil {
            self.navigationItem.title = SettingData.shared.location
        }
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AdCell.self, forCellWithReuseIdentifier: adCellId)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: popularCellId)
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showclass" {
            
            let viewController  = segue.destination as! ClassificationViewController
            
            self.delegate = viewController
            
        }
        
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
        
        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCellId, for: indexPath) as! PopularCell
            cell.images = imagesArray2
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
          delegate?.sendView(data: 0)
        print("전체")
    }
    @objc func two(_ sender: UITapGestureRecognizer) {
        
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("일인분 주문")
        delegate?.sendView(data: 1)
    }
    @objc func three(_ sender: UITapGestureRecognizer) {
        
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 2)
    }
    @objc func four(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 3)
        
    }
    @objc func five(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 4)
    }
    @objc func six(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 5)
    }
    @objc func seven(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 6)
    }
    @objc func eight(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 7)
    }
    @objc func nine(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 8)
    }
    @objc func ten(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 9)
    }
    @objc func eleven(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 10)
    }
    @objc func twelve(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 11)
    }
    @objc func thirteen(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 11)
    }
    @objc func fourteen(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "showclass", sender: self)
        print("요기요 플러스")
        delegate?.sendView(data: 11)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        else if indexPath.section == 3 {
            return CGSize(width: view.frame.width, height: 150)
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
