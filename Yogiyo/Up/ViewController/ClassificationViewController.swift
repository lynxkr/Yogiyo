//
//  ClassificationViewController.swift
//  CustomTabBar
//
//  Created by seunghwan Lee on 20/10/2018.
//  Copyright © 2018 seunghwan Lee. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ClassificationViewController: UIViewController {
    let vc = UIView()

    @IBAction func pressFilterButton(_ sender: Any) {

    }
    let restaurantTableView: UITableView = UITableView()
    let cafeTableView: UITableView = UITableView()
    let pubTableView: UITableView = UITableView()
    var indicatorViewLeadingConstraint:NSLayoutConstraint!
    
    lazy var restaurantList: [eatery] = {
        var list = [eatery]()
        return list
    }()
    
    lazy var cafeList: [eatery] = {
        var list = [eatery]()
        return list
    }()
    
    lazy var pubList: [eatery] = {
        var list = [eatery]()
        return list
    }()
    
    var customTabBarCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 60), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0x82, green: 0x33, blue: 0x2F)
        return view
    }()
    
    var customTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    @IBOutlet weak var searchViewTopConst: NSLayoutConstraint!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var recommendButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @objc func centerButtonDidTap(){
        print("지도")
    }
    override func viewDidLoad() {
        let buttonTitle = UIButton()
        buttonTitle.setTitle("성수동 121가", for: .normal)
        buttonTitle.setTitleColor(.black, for: .normal)
        buttonTitle.addTarget(self, action: #selector(centerButtonDidTap), for: .touchUpInside)
        super.viewDidLoad()
        
        mainScrollView.delegate = self
       
        self.navigationItem.titleView = buttonTitle
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let rightButton = UIBarButtonItem()
        rightButton.title = "검색"
        rightButton.tintColor = .black

        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton

        setUpTableView()
        fitTableViewPosition()
        setupCustomTabBar()
//        searchViewTopConst.constant = 50
//        buttonSetUp()
        
        let resNib = UINib(nibName: "RestaurantCell", bundle: nil)
        restaurantTableView.register(resNib, forCellReuseIdentifier: "RestaurantCell")
        let cafeNib = UINib(nibName: "CafeCell", bundle: nil)
        cafeTableView.register(cafeNib, forCellReuseIdentifier: "CafeCell")
        let pubNib = UINib(nibName: "PubCell", bundle: nil)
        pubTableView.register(pubNib, forCellReuseIdentifier: "PubCell")
        
        cellOfEatery()
    }
    
    func cellOfEatery() {
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        if let contents = try? String(contentsOfFile: path!) {
            if let data = contents.data(using: .utf8) {
                let result = try? JSONDecoder().decode(eateryVO.self, from: data)
                for row in result!.data.restaurant {
                    let restaurantOV = eatery()
                    restaurantOV.name = row.name
                    restaurantOV.rating = row.rating
                    restaurantOV.tag = row.tag
                    restaurantOV.followers = row.followers
                    restaurantOV.foodImageURL = row.foodImage
                    self.restaurantList.append(restaurantOV)
                }
                    self.restaurantTableView.reloadData()
                
                for row in result!.data.cafe {
                    let cafeOV = eatery()
                    cafeOV.name = row.name
                    cafeOV.rating = row.rating
                    cafeOV.tag = row.tag
                    cafeOV.followers = row.followers
                    cafeOV.foodImageURL = row.foodImage
                    self.cafeList.append(cafeOV)
                }
                    self.cafeTableView.reloadData()
                
                for row in result!.data.pub {
                    let pubOV = eatery()
                    pubOV.name = row.name
                    pubOV.rating = row.rating
                    pubOV.tag = row.tag
                    pubOV.followers = row.followers
                    pubOV.foodImageURL = row.foodImage
                    self.pubList.append(pubOV)
                }
                    self.pubTableView.reloadData()
            }
        }
    }
    
    func setupCollectioView(){
        customTabBarCollectionView.delegate = self
        customTabBarCollectionView.dataSource = self
        customTabBarCollectionView.backgroundColor = .white
        customTabBarCollectionView.showsHorizontalScrollIndicator = false
        let customNib = UINib(nibName: "CustomCell", bundle: nil)
        customTabBarCollectionView.register(customNib, forCellWithReuseIdentifier: "CustomCell")
        customTabBarCollectionView.isScrollEnabled = false
    }
    
    func setupCustomTabBar(){
        setupCollectioView()
        self.view.addSubview(customTabBar)
        customTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customTabBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        customTabBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        customTabBar.addSubview(customTabBarCollectionView)
        customTabBarCollectionView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor).isActive = true
        customTabBarCollectionView.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor).isActive = true
        customTabBarCollectionView.topAnchor.constraint(equalTo: customTabBar.topAnchor).isActive = true
        customTabBarCollectionView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        customTabBar.addSubview(indicatorView)
        indicatorView.widthAnchor.constraint(equalToConstant: self.view.frame.width/3).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        //        indicatorView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
        indicatorView.bottomAnchor.constraint(equalToSystemSpacingBelow: customTabBar.bottomAnchor, multiplier: -0.5).isActive = true
        
        let bottomLine = UIView()
        customTabBar.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        bottomLine.backgroundColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8)
        bottomLine.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalToSystemSpacingBelow: customTabBar.bottomAnchor, multiplier: 0).isActive = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
        if  mainScrollView.isDragging  {
            indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 3
        } else {
            indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 3
        }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == mainScrollView {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let index = IndexPath(item: itemAt, section: 0)
        switch itemAt {
        case 0:
        let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
        cell?.label.textColor = .black
        let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 1, section: 0)) as? CustomCell
        cell1?.label.textColor = .lightGray
        let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? CustomCell
        cell2?.label.textColor = .lightGray
        case 1:
        let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
        cell?.label.textColor = .black
        let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? CustomCell
        cell1?.label.textColor = .lightGray
        let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? CustomCell
        cell2?.label.textColor = .lightGray
        case 2:
        let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
        cell?.label.textColor = .black
        let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? CustomCell
        cell1?.label.textColor = .lightGray
        let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 1, section: 0)) as? CustomCell
        cell2?.label.textColor = .lightGray
        default: break
        }
        }
    }
    
    func fitTableViewPosition() {
        mainScrollView.contentSize.width = self.view.frame.width * CGFloat(3)

        mainScrollView.addSubview(restaurantTableView)
        mainScrollView.addSubview(cafeTableView)
        mainScrollView.addSubview(pubTableView)

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        restaurantTableView.translatesAutoresizingMaskIntoConstraints = false
        cafeTableView.translatesAutoresizingMaskIntoConstraints = false
        pubTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
              restaurantTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
              cafeTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
              pubTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
              restaurantTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              restaurantTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
              restaurantTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              restaurantTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              restaurantTableView.trailingAnchor.constraint(equalTo: cafeTableView.leadingAnchor),
              cafeTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              cafeTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              cafeTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              cafeTableView.trailingAnchor.constraint(equalTo: pubTableView.leadingAnchor),
              pubTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              pubTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              pubTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              pubTableView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor)
            ])
    }
    
    func setUpTableView() {
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        cafeTableView.delegate = self
        cafeTableView.dataSource = self
        pubTableView.delegate = self
        pubTableView.dataSource = self
        
       
    }
    
//    func buttonSetUp() {
//        filterButton.layer.borderColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8).cgColor
//        filterButton.layer.borderWidth = 1
//        filterButton.layer.cornerRadius = 12
//
//        recommendButton.layer.borderColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8).cgColor
//        recommendButton.layer.borderWidth = 1
//        recommendButton.layer.cornerRadius = 12
//
//        mapButton.layer.borderColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8).cgColor
//        mapButton.layer.borderWidth = 1
//        mapButton.layer.cornerRadius = 12
//
//        searchButton.layer.borderColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8).cgColor
//        searchButton.layer.borderWidth = 1
//        searchButton.layer.cornerRadius = 5
//    }
}

extension ClassificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case restaurantTableView: return restaurantList.count
        case cafeTableView: return cafeList.count
        case pubTableView: return pubList.count
        default : return 0
        }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToStore", sender: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == restaurantTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            cell.name.text = restaurantList[indexPath.row].name
            cell.tagLabel.text = restaurantList[indexPath.row].tag
            
            let eateryOV = restaurantList[indexPath.row]
            
            let url = eateryOV.foodImageURL![0]
            
            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            Alamofire.request(encodedUrl!).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    let img = image
                    
                    eateryOV.foodImage = []
                    eateryOV.foodImage?.append(img)
                    print("kk",eateryOV.foodImage![0])
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                cell.imageCollection.image = self.restaurantList[indexPath.row].foodImage?[0]
                cell.imageCollection.clipsToBounds = true
                cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
            }

            cell.selectionStyle = .none
            return cell
        } else if tableView == cafeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CafeCell", for: indexPath) as! CafeCell
            cell.name.text = cafeList[indexPath.row].name
            cell.tagLabel.text = cafeList[indexPath.row].tag
            
            let eateryOV = cafeList[indexPath.row]
            
            let url = eateryOV.foodImageURL![0]
            
            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            Alamofire.request(encodedUrl!).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    let img = image
                    
                    eateryOV.foodImage = []
                    eateryOV.foodImage?.append(img)
                    print("kk",eateryOV.foodImage![0])
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                cell.imageCollection.image = self.cafeList[indexPath.row].foodImage?[0]
                cell.imageCollection.clipsToBounds = true
                cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
            }
            
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PubCell", for: indexPath) as! PubCell
            cell.name.text = pubList[indexPath.row].name
            cell.tagLabel.text = pubList[indexPath.row].tag
           
            let eateryOV = pubList[indexPath.row]
            
            let url = eateryOV.foodImageURL![0]
           
            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            Alamofire.request(encodedUrl!).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    let img = image
                   
                        eateryOV.foodImage = []
                        eateryOV.foodImage?.append(img)
                    print("kk",eateryOV.foodImage![0])
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                cell.imageCollection.image = self.pubList[indexPath.row].foodImage?[0]
                cell.imageCollection.clipsToBounds = true
                 cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
            }
            
//            getImageArray(indexPath.row, pubList) { (imgArray) in
//                cell.imgArray = imgArray
//            }
               
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func getImageArray(_ index: Int, _ eatery: [eatery] ,completion: @escaping ([UIImage]) -> ()) {
        if let savedImgArray = eatery[index].foodImage {
            completion(savedImgArray)
        } else {
            let eateryOV = eatery[index]
            var counter = 1
            for imageURL in eateryOV.foodImageURL! {
                let url = imageURL
                let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                
                Alamofire.request(encodedUrl!).responseImage { response in
                    switch response.result {
                    case .success(_): if let image = response.result.value {
                        let img = image
                        if counter == 1 {
                            eateryOV.foodImage = []
                            eateryOV.foodImage?.append(img)
                            counter += 1
                        } else {
                            eateryOV.foodImage?.append(img)
                            counter += 1
                        }
                        if eateryOV.foodImage?.count == 4{
                            completion(eateryOV.foodImage!)
                        }
                        }
                    case .failure(let err) : print("에러: \(err)")
                    }
                }
            }
        }
    }
}

extension ClassificationViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        if indexPath.row == 0 {
            cell.label.textColor = .black
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
        switch indexPath.row {
        case 0 : cell.label.text = "맛집"
        case 1 : cell.label.text = "카페"
        case 2 : cell.label.text = "술집"
        default: break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3 , height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
        cell.label.textColor = .black
        indicatorViewLeadingConstraint.constant = (self.view.frame.width / 3) * CGFloat((indexPath.row))
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.customTabBar.layoutIfNeeded()
        }, completion: nil)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.mainScrollView.contentOffset.x = self.view.frame.width * CGFloat(indexPath.row)
            }, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
        cell.label.textColor = .lightGray
    }
}





//func getImageArray(_ index: Int, _ eatery: [eatery] ,completion: @escaping ([UIImage]) -> ()) {
//    if let savedImgArray = eatery[index].foodImage {
//        completion(savedImgArray)
//    } else {
//        let eateryOV = eatery[index]
//        var counter = 1
//        for imageURL in eateryOV.foodImageURL! {
//            let url = imageURL
//            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//
//            Alamofire.request(encodedUrl!).responseImage { response in
//                switch response.result {
//                case .success(_): if let image = response.result.value {
//                    let img = image
//                    if counter == 1 {
//                        eateryOV.foodImage = []
//                        eateryOV.foodImage?.append(img)
//                        counter += 1
//                    } else {
//                        eateryOV.foodImage?.append(img)
//                        counter += 1
//                    }
//                    if eateryOV.foodImage?.count == 4{
//                        completion(eateryOV.foodImage!)
//                    }
//                    }
//                case .failure(let err) : print("에러: \(err)")
//                }
//            }
//        }
//    }
//}
