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
    let filterView = UIView()

    @IBAction func pressFilterButton(_ sender: Any) {
        filterView.isHidden.toggle()
    }
    let restaurantTableView: UITableView = UITableView()
    let cafeTableView: UITableView = UITableView()
    let pubTableView: UITableView = UITableView()
    var indicatorViewLeadingConstraint:NSLayoutConstraint!
    
    lazy var restaurantList: [FoodlistElement] = {
        var list = [FoodlistElement]()
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
       filterView.isHidden = true
        
        
        
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
        
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.backgroundColor = .white

        let switch1 = UISwitch()
        let switch2 = UISwitch()
        let switch3 = UISwitch()
        
        let label1 = UILabel()
        let label2 = UILabel()
        let label3 = UILabel()
        
        let buttonClose = UIButton()
        let buttonEnter = UIButton()
        
        buttonClose.setTitle("X", for: .normal)
        buttonClose.setTitleColor(.black, for: .normal)
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.tag = 0
        buttonClose.addTarget(self, action: #selector(didfilterButtonTap(button:)), for: .touchUpInside)
        buttonEnter.setTitle("적용", for: .normal)
        buttonEnter.setTitleColor(.black, for: .normal)
        buttonEnter.tag = 1

        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.addTarget(self, action: #selector(didfilterButtonTap(button:)), for: .touchUpInside)

        label1.text = "요기요 랭킹순"
        label2.text = "별점순"
        label3.text = "리뷰 많은순"
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false

        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch2.translatesAutoresizingMaskIntoConstraints = false
        switch3.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(filterView)
        
        filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        filterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        filterView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        filterView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        filterView.addSubview(switch1)
        filterView.addSubview(switch2)
        filterView.addSubview(switch3)
        
        filterView.addSubview(label1)
        filterView.addSubview(label2)
        filterView.addSubview(label3)
        
        filterView.addSubview(buttonClose)
        filterView.addSubview(buttonEnter)
        
        switch1.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 30).isActive = true
        switch1.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 50).isActive = true
        
        switch2.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 30).isActive = true
        switch2.topAnchor.constraint(equalTo: switch1.bottomAnchor, constant: 30).isActive = true
        
        switch3.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 30).isActive = true
        switch3.topAnchor.constraint(equalTo: switch2.bottomAnchor, constant: 30).isActive = true
        
        label1.leadingAnchor.constraint(equalTo: switch1.trailingAnchor, constant: 30).isActive = true
        label1.centerYAnchor.constraint(equalTo: switch1.centerYAnchor).isActive = true
        
        label2.leadingAnchor.constraint(equalTo: switch2.trailingAnchor, constant: 30).isActive = true
        label2.centerYAnchor.constraint(equalTo: switch2.centerYAnchor).isActive = true

        
        label3.leadingAnchor.constraint(equalTo: switch3.trailingAnchor, constant: 30).isActive = true
        label3.centerYAnchor.constraint(equalTo: switch3.centerYAnchor).isActive = true
        
        buttonEnter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        buttonEnter.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        buttonClose.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 10).isActive = true
        buttonClose.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 10).isActive = true
        


    }
    @objc func didfilterButtonTap(button : UIButton){
        switch button.tag {
        case 0:
            print("buttonclose")
            filterView.isHidden.toggle()
        case 1:
            print("buttonenter")
            filterView.isHidden.toggle()

        default:
            break
        }
        
    }
    func cellOfEatery() {
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        let headers: HTTPHeaders = [
            "Authorization": "Token adb514c18358cc0a90c3d6658ddf29f12a621f65",
            "Accept": "application/json"
        ]
        Alamofire.request("https://jogiyo.co.kr/restaurants/api/restaurant/", method: .get
            , encoding: JSONEncoding.default , headers: headers).responseData { response in
            
                debugPrint(response)
                
                if let jsonData = response.result.value {
                    let result = try? JSONDecoder().decode(Foodlist.self, from: jsonData)
                    self.restaurantList = result!
                }
        
                
            
                
                
                self.restaurantTableView.reloadData()
        }
        if let contents = try? String(contentsOfFile: path!) {
            if let data = contents.data(using: .utf8) {
                let result = try? JSONDecoder().decode(eateryVO.self, from: data)
//                for row in result!.data.restaurant {
//                    let restaurantOV = eatery()
//                    restaurantOV.name = row.name
//                    restaurantOV.rating = row.rating
//                    restaurantOV.tag = row.tag
//                    restaurantOV.followers = row.followers
//                    restaurantOV.foodImageURL = row.foodImage
//                    self.restaurantList.append(restaurantOV)
//                }
//                    self.restaurantTableView.reloadData()
//
//                for row in result!.data.cafe {
//                    let cafeOV = eatery()
//                    cafeOV.name = row.name
//                    cafeOV.rating = row.rating
//                    cafeOV.tag = row.tag
//                    cafeOV.followers = row.followers
//                    cafeOV.foodImageURL = row.foodImage
//                    self.cafeList.append(cafeOV)
//                }
//                    self.cafeTableView.reloadData()
//
//                for row in result!.data.pub {
//                    let pubOV = eatery()
//                    pubOV.name = row.name
//                    pubOV.rating = row.rating
//                    pubOV.tag = row.tag
//                    pubOV.followers = row.followers
//                    pubOV.foodImageURL = row.foodImage
//                    self.pubList.append(pubOV)
//                }
//                    self.pubTableView.reloadData()
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
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            cell.name.text = restaurantList[indexPath.row].name
            cell.tagLabel.text = "⏱"+restaurantList[indexPath.row].estimatedDeliveryTime
            cell.minOrder.text = "\(restaurantList[indexPath.row].minOrderAmount)원"
            cell.rating.text = restaurantList[indexPath.row].reviewAvg
            cell.reviewCounts.text = "\(restaurantList[indexPath.row].reviewCount)"
       let cesco = restaurantList[indexPath.row].tags.contains { (form:Category) -> Bool in
            if form.name == "CESCO"{
                return true
            }else{ return false}
            }
            cesco ? cell.cescoImage.image = UIImage(named: "cesco") : ()
    

                    let url = restaurantList[indexPath.row].logoURL
        
//                    let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        Alamofire.request(url).responseImage { response in
                        switch response.result {
                        case .success(_): if let image = response.result.value {
                            let img = image
                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                cell.imageCollection.image = img
                                cell.imageCollection.clipsToBounds = true
                                cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
//                            }
                       
                            }
                        case .failure(let err) : print("에러: \(err)")
                        }
                    }
        
        
                    cell.selectionStyle = .none
                    return cell
       
    }
//            let url = eateryOV.foodImageURL![0]
            
//            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            Alamofire.request(encodedUrl!).responseImage { response in
//                switch response.result {
//                case .success(_): if let image = response.result.value {
//                    let img = image
//
//                    eateryOV.foodImage = []
//                    eateryOV.foodImage?.append(img)
//                    print("kk",eateryOV.foodImage![0])
//                    }
//                case .failure(let err) : print("에러: \(err)")
//                }
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                cell.imageCollection.image = self.restaurantList[indexPath.row].foodImage?[0]
//                cell.imageCollection.clipsToBounds = true
//                cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
//            }
//
//            cell.selectionStyle = .none
//            return cell
//        } else if tableView == cafeTableView {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CafeCell", for: indexPath) as! CafeCell
//            cell.name.text = cafeList[indexPath.row].name
//            cell.tagLabel.text = cafeList[indexPath.row].tag
//
//            let eateryOV = cafeList[indexPath.row]
//
//            let url = eateryOV.foodImageURL![0]
//
//            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            Alamofire.request(encodedUrl!).responseImage { response in
//                switch response.result {
//                case .success(_): if let image = response.result.value {
//                    let img = image
//
//                    eateryOV.foodImage = []
//                    eateryOV.foodImage?.append(img)
//                    print("kk",eateryOV.foodImage![0])
//                    }
//                case .failure(let err) : print("에러: \(err)")
//                }
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                cell.imageCollection.image = self.cafeList[indexPath.row].foodImage?[0]
//                cell.imageCollection.clipsToBounds = true
//                cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
//            }
//
//            cell.selectionStyle = .none
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PubCell", for: indexPath) as! PubCell
//            cell.name.text = pubList[indexPath.row].name
//            cell.tagLabel.text = pubList[indexPath.row].tag
//
//            let eateryOV = pubList[indexPath.row]
//
//            let url = eateryOV.foodImageURL![0]
           
//            let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            Alamofire.request(encodedUrl!).responseImage { response in
//                switch response.result {
//                case .success(_): if let image = response.result.value {
//                    let img = image
//
//                        eateryOV.foodImage = []
//                        eateryOV.foodImage?.append(img)
//                    print("kk",eateryOV.foodImage![0])
//                    }
//                case .failure(let err) : print("에러: \(err)")
//                }
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                cell.imageCollection.image = self.pubList[indexPath.row].foodImage?[0]
//                cell.imageCollection.clipsToBounds = true
//                 cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
//            }
//
////            getImageArray(indexPath.row, pubList) { (imgArray) in
////                cell.imgArray = imgArray
////            }
//
//            cell.selectionStyle = .none
//            return cell
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
