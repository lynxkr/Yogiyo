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

protocol SendDataDelegate {
    
    func sendData(data: Int)
    
}



class ClassificationViewController: UIViewController {
    
    let switch1 = UISwitch()
    let switch2 = UISwitch()
    let switch3 = UISwitch()
    let switch4 = UISwitch()
    let switch5 = UISwitch()
    
    let filterView = UIView()
    var turnOn = 0 // 켜진 스위치 개수
    var tagNumber = 0
    var delegate: SendDataDelegate?
    
    @IBAction func pressFilterButton(_ sender: Any) {
        filterView.isHidden.toggle()
    }
    let restaurantTableView: UITableView = UITableView() //1
    let soloTableView: UITableView = UITableView() //2
    let chickenTableView: UITableView = UITableView() //3
    let chinaTableView: UITableView = UITableView() //4
    let pizzaTableView: UITableView = UITableView()  //5
    let koreaTableView: UITableView = UITableView() //6
    let bunTableView: UITableView = UITableView() //7
    let cafeTableView: UITableView = UITableView() //8
    let jokTableView: UITableView = UITableView() //9
    let japanTableView: UITableView = UITableView() //10
    let nightTableView: UITableView = UITableView() //11
    let franTableView: UITableView = UITableView() //12
    
   
    var indicatorViewLeadingConstraint:NSLayoutConstraint!
    
    lazy var restaurantList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    
    lazy var soloList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    
    lazy var chickenList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var chinaList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var pizzaList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var koreaList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var bunList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var cafeList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var jokList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var japanList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var nightList: [FoodlistElement] = {
        var list = [FoodlistElement]()
        return list
    }()
    lazy var franList: [FoodlistElement] = {
        var list = [FoodlistElement]()
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
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToStore" {
            
            let viewController  = segue.destination as! RestaurantViewController
            
            self.delegate = viewController
            
        }
        
    }
    func changeView(tag : Int){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.12, delay: 0, options: .curveLinear, animations: {
                self.mainScrollView.contentOffset.x = self.view.frame.width * CGFloat(tag)
            }, completion: nil)
        }
    }
  
    @objc func didReceiveTestNotification(_ notification: Notification) {
    guard let testString: String = notification.userInfo?["TestString"] as? String else { return }
    
    print("testString :", testString)
    }
    override func viewDidAppear(_ animated: Bool) {
        if SettingData.shared.location != nil {
            self.navigationItem.title = SettingData.shared.location
        }
    }

    override func viewDidLoad() {
       filterView.isHidden = true
       
        super.viewDidLoad()
        
        mainScrollView.delegate = self
       
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
//        let rightButton = UIBarButtonItem()
//        rightButton.title = "검색"
//        rightButton.tintColor = .black
//
//        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton

        setUpTableView()
        fitTableViewPosition()
        setupCustomTabBar()
//        searchViewTopConst.constant = 50
//        buttonSetUp()
        
        let resNib = UINib(nibName: "RestaurantCell", bundle: nil)
        
        let tablelist : [UITableView] = [
            restaurantTableView,
            soloTableView,
            chickenTableView,
            chinaTableView,
            pizzaTableView,
            koreaTableView,
            bunTableView,
            cafeTableView,
            jokTableView,
            japanTableView,
            nightTableView,
            franTableView
        ]
        for table in tablelist {
            table.register(resNib, forCellReuseIdentifier: "RestaurantCell")
        }
     
        
        cellOfEatery()
        
        filterviewConfig()
       
        print(tagNumber,"tag")
       changeView(tag : tagNumber)

    }
    
    func filterviewConfig(){
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.backgroundColor = .white
        

        
        let switchs = [
         switch1,
        switch2,
        switch3,
        switch4,
        switch5
        ]
        let label1 = UILabel()
        let label2 = UILabel()
        let label3 = UILabel()
        let label4 = UILabel()
        let label5 = UILabel()
        
        let labels = [label1,label2,label3,label4,label5]
        
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
        
        label1.text = "별점순"
        label2.text = "리뷰 많은순"
        label3.text = "배달 시간순"
        label4.text = "최소 주문 금액순"
        label5.text = "거리순"
        
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for swich in switchs {
            swich.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(filterView)
        
        filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        filterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        filterView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        filterView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        for siwt in switchs{
            filterView.addSubview(siwt)
            siwt.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        }
   
        
        switch1.tag = 0
        switch2.tag = 1
        switch3.tag = 2
        switch4.tag = 3
        switch5.tag = 4
        
 

        for label in labels{
            filterView.addSubview(label)
        }
        
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
        
        switch4.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 30).isActive = true
        switch4.centerYAnchor.constraint(equalTo: switch1.centerYAnchor).isActive = true
        
        label4.leadingAnchor.constraint(equalTo: switch4.trailingAnchor, constant: 30).isActive = true
        label4.centerYAnchor.constraint(equalTo: switch1.centerYAnchor).isActive = true
        
        label2.leadingAnchor.constraint(equalTo: switch2.trailingAnchor, constant: 30).isActive = true
        label2.centerYAnchor.constraint(equalTo: switch2.centerYAnchor).isActive = true
        
        switch5.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 30).isActive = true
        switch5.centerYAnchor.constraint(equalTo: switch2.centerYAnchor).isActive = true
        
        label5.leadingAnchor.constraint(equalTo: switch5.trailingAnchor, constant: 30).isActive = true
        label5.centerYAnchor.constraint(equalTo: switch2.centerYAnchor).isActive = true
        
        
        label3.leadingAnchor.constraint(equalTo: switch3.trailingAnchor, constant: 30).isActive = true
        label3.centerYAnchor.constraint(equalTo: switch3.centerYAnchor).isActive = true
        
        buttonEnter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        buttonEnter.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        buttonClose.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 10).isActive = true
        buttonClose.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 10).isActive = true
    }
    @objc func switchChanged(switchFilter: UISwitch) {
        let value = switchFilter.isOn
        guard value else { return }
        switch switchFilter.tag {
        case 0: cellOfEatery(filter: "-review_avg")
        switch2.setOn(false, animated: true)
        switch3.setOn(false, animated: true)
        switch4.setOn(false, animated: true)
        switch5.setOn(false, animated: true)
        case 1: cellOfEatery(filter: "-review_count")
        switch1.setOn(false, animated: true)
        switch3.setOn(false, animated: true)
        switch4.setOn(false, animated: true)
        switch5.setOn(false, animated: true)
        case 2: cellOfEatery(filter: "estimated_delivery_time")
        switch1.setOn(false, animated: true)
        switch2.setOn(false, animated: true)
        switch4.setOn(false, animated: true)
        switch5.setOn(false, animated: true)
        case 3: cellOfEatery(filter: "min_order_amount")
        switch1.setOn(false, animated: true)
        switch2.setOn(false, animated: true)
        switch3.setOn(false, animated: true)
        switch5.setOn(false, animated: true)
        case 4: cellOfEatery(filter: "distance")
        switch1.setOn(false, animated: true)
        switch2.setOn(false, animated: true)
        switch3.setOn(false, animated: true)
        switch4.setOn(false, animated: true)
            break
        default:
            break
        }
        // Do something
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
    func cellOfEatery(filter : String = "") {
        let headers: HTTPHeaders = [
            
            "Accept": "application/json"
        ]
        
        var params : Parameters = [
            "lat" : "\(SettingData.shared.latitude!)",
            "lng" : "\(SettingData.shared.longitude!)"
        ]
        if filter != "" {
            params.updateValue(filter, forKey: "ordering")
            
        }
        let url = "https://jogiyo.co.kr/restaurants/api/restaurant/"
        print(url)
       
        Alamofire.request(url, method: .get, parameters: params
            ).responseData { response in
            
                debugPrint(response)
                
                if let jsonData = response.result.value {
                    let result = try? JSONDecoder().decode(Foodlist.self, from: jsonData)
                    
                    
                    self.restaurantList = result!
                    
                    
                    self.chickenList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "치킨" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.soloList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "1인분주문" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.chinaList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "중식" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.pizzaList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "피자양식" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.koreaList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "한식" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.bunList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "분식" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.cafeList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "카페디저트" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.jokList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "족발보쌈" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.japanList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "일식돈까스" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.nightList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "야식" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    self.franList = result!.filter({ (Food:FoodlistElement) -> Bool in
                        let check = Food.categories.contains(where: { (Cate:Category) -> Bool in
                            if Cate.name == "프랜차이즈" {return true}
                            else { return false }
                        })
                        
                        
                        return check
                    })
                    
                }
        
                
            
                let tablelist : [UITableView] = [
                    self.restaurantTableView,
                    self.soloTableView,
                    self.chickenTableView,
                    self.chinaTableView,
                    self.pizzaTableView,
                    self.koreaTableView,
                    self.bunTableView,
                    self.cafeTableView,
                    self.jokTableView,
                    self.japanTableView,
                    self.nightTableView,
                    self.franTableView
                ]
                
                for table in tablelist {
                    table.reloadData()
                    print("1")
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
        customTabBarCollectionView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
        
//        customTabBarCollectionView.heightAnchor.constraint(equalToConstant: 48).isActive = true
//        customTabBar.addSubview(indicatorView)
//        indicatorView.widthAnchor.constraint(equalToConstant: self.view.frame.width/8).isActive = true
//        indicatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
//        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor)
//        indicatorViewLeadingConstraint.isActive = true
//        //        indicatorView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
//        indicatorView.bottomAnchor.constraint(equalToSystemSpacingBelow: customTabBar.bottomAnchor, multiplier: -0.5).isActive = true
        customTabBarCollectionView.addSubview(indicatorView)
        indicatorView.widthAnchor.constraint(equalTo: customTabBarCollectionView.widthAnchor, multiplier: 0.2).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: customTabBarCollectionView.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: customTabBarCollectionView.bottomAnchor, constant: 40).isActive = true
        
     
        
//        let bottomLine = UIView()
//        customTabBar.addSubview(bottomLine)
//        bottomLine.translatesAutoresizingMaskIntoConstraints = false
//        bottomLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
//        bottomLine.backgroundColor = UIColor(red: 0xA8, green: 0xA8, blue: 0xA8)
//        bottomLine.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor).isActive = true
//        bottomLine.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor).isActive = true
//        bottomLine.bottomAnchor.constraint(equalToSystemSpacingBelow: customTabBar.bottomAnchor, multiplier: 0).isActive = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
        if  mainScrollView.isDragging  {
            indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 5
        } else {
            indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 5
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
        for i in 1...11{
            let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
            setcell?.label.textColor = .lightGray
        }
        case 1:
        let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
        cell?.label.textColor = .black
        let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? CustomCell
        cell1?.label.textColor = .lightGray
        let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? CustomCell
        cell2?.label.textColor = .lightGray
        for i in 3...11{
            let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
            setcell?.label.textColor = .lightGray
            }
        case 2:
        let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
        cell?.label.textColor = .black
        let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? CustomCell
        cell1?.label.textColor = .lightGray
        let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 1, section: 0)) as? CustomCell
        cell2?.label.textColor = .lightGray
        for i in 3...11{
            let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
            setcell?.label.textColor = .lightGray
            }
        case 3:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? CustomCell
            cell1?.label.textColor = .lightGray
            let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 1, section: 0)) as? CustomCell
            cell2?.label.textColor = .lightGray
            let cell3 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? CustomCell
            cell3?.label.textColor = .lightGray
            for i in 4...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 4:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...3{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
            for i in 5...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 5:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...4{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
            for i in 6...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 6:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...5{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
            for i in 7...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 7:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...6{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
            for i in 8...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 8:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...7{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
            for i in 9...11{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 9:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 10, section: 0)) as? CustomCell
            cell1?.label.textColor = .lightGray
            let cell2 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 11, section: 0)) as? CustomCell
            cell2?.label.textColor = .lightGray
            for i in 0...8{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 10:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            let cell1 = customTabBarCollectionView.cellForItem(at: IndexPath(item: 11, section: 0)) as? CustomCell
            cell1?.label.textColor = .lightGray
            for i in 0...9{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        case 11:
            let cell = customTabBarCollectionView.cellForItem(at: index) as? CustomCell
            cell?.label.textColor = .black
            for i in 0...10{
                let setcell = customTabBarCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? CustomCell
                setcell?.label.textColor = .lightGray
            }
        default: break
        }
        }
    }
    
    func fitTableViewPosition() {
        let tablelist : [UITableView] = [
            restaurantTableView,
            soloTableView,
            chickenTableView,
            chinaTableView,
            pizzaTableView,
            koreaTableView,
            bunTableView,
            cafeTableView,
            jokTableView,
            japanTableView,
            nightTableView,
            franTableView
        ]
        mainScrollView.contentSize.width = self.view.frame.width * CGFloat(12)

        for table in tablelist {
            mainScrollView.addSubview(table)
            table.translatesAutoresizingMaskIntoConstraints = false
        }
  

        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            restaurantTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            soloTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            chickenTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            chinaTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            pizzaTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            koreaTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            bunTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            cafeTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            jokTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            japanTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            nightTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            franTableView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor),
            
              restaurantTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              restaurantTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
              restaurantTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              restaurantTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              restaurantTableView.trailingAnchor.constraint(equalTo: soloTableView.leadingAnchor),
              
              soloTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              soloTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              soloTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              soloTableView.trailingAnchor.constraint(equalTo: chickenTableView.leadingAnchor),
              chickenTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              chickenTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              chickenTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              chickenTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              chickenTableView.trailingAnchor.constraint(equalTo: chinaTableView.leadingAnchor),
              chinaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              chinaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              chinaTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              chinaTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              chinaTableView.trailingAnchor.constraint(equalTo: pizzaTableView.leadingAnchor),
              pizzaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              pizzaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              pizzaTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              pizzaTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              pizzaTableView.trailingAnchor.constraint(equalTo: koreaTableView.leadingAnchor),
              koreaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              koreaTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              koreaTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              koreaTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              koreaTableView.trailingAnchor.constraint(equalTo: bunTableView.leadingAnchor),
              bunTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              bunTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              bunTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              bunTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              bunTableView.trailingAnchor.constraint(equalTo: cafeTableView.leadingAnchor),
              cafeTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              cafeTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              cafeTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              cafeTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              cafeTableView.trailingAnchor.constraint(equalTo: jokTableView.leadingAnchor),
              jokTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              jokTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              jokTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              jokTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              jokTableView.trailingAnchor.constraint(equalTo: japanTableView.leadingAnchor),
              japanTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              japanTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              japanTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              japanTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              japanTableView.trailingAnchor.constraint(equalTo: nightTableView.leadingAnchor),
              nightTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              nightTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              nightTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              nightTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              nightTableView.trailingAnchor.constraint(equalTo: franTableView.leadingAnchor),
              nightTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              franTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
              
              
              franTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
              franTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
              franTableView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor)
            
            ])
    }
    
    func setUpTableView() {
        
        let tablelist : [UITableView] = [
            restaurantTableView,
            soloTableView,
            chickenTableView,
            chinaTableView,
            pizzaTableView,
            koreaTableView,
            bunTableView,
            cafeTableView,
            jokTableView,
            japanTableView,
            nightTableView,
            franTableView
        ]
        
        for table in tablelist {
            table.delegate = self
            table.dataSource = self
        }
        
       
    }
    
}

extension ClassificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        switch tableView {
        case restaurantTableView: return restaurantList.count  == 0 ? 1 : restaurantList.count
        case soloTableView: return soloList.count == 0 ? 1 : soloList.count
        case chickenTableView: return chickenList.count == 0 ? 1 : chickenList.count
            
        case chinaTableView: return chinaList.count == 0 ? 1 : chinaList.count
        case pizzaTableView: return pizzaList.count == 0 ? 1 : pizzaList.count
        case koreaTableView: return koreaList.count == 0 ? 1 : koreaList.count
            
        case bunTableView: return bunList.count == 0 ? 1 : bunList.count
        case cafeTableView: return cafeList.count == 0 ? 1 : cafeList.count
        case jokTableView: return jokList.count == 0 ? 1 : jokList.count
            
        case japanTableView: return japanList.count == 0 ? 1 : japanList.count
        case nightTableView: return nightList.count == 0 ? 1 : nightList.count
        case franTableView: return franList.count == 0 ? 1 : franList.count
            
       
        default : return 0
        }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToStore", sender: nil)
        
        delegate?.sendData(data: (tableView.cellForRow(at: indexPath) as! RestaurantCell).id)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == restaurantTableView{
            return settingCell(list: restaurantList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == soloTableView {
           return settingCell(list: soloList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == chickenTableView {
            return settingCell(list: chickenList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == chinaTableView {
            return settingCell(list: chinaList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == pizzaTableView {
            return settingCell(list: pizzaList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == koreaTableView {
            return settingCell(list: koreaList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == bunTableView {
            return settingCell(list: bunList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == cafeTableView {
            return settingCell(list: cafeList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == jokTableView {
            return settingCell(list: jokList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == japanTableView {
            return settingCell(list: japanList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == nightTableView {
            return settingCell(list: nightList, indexPath: indexPath, tableView: tableView)
        }
        else if tableView == franTableView {
            return settingCell(list: franList, indexPath: indexPath, tableView: tableView)
        }
        else {
             let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            return cell
        }
       
    }

    
    func settingCell(list :[FoodlistElement],indexPath : IndexPath,tableView : UITableView)-> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            if list.count == 0 {return cell}
            cell.name.text = list[indexPath.row].name
        cell.tagLabel.text = "⏱"+list[indexPath.row].estimatedDeliveryTime.rawValue
            cell.minOrder.text = "\(list[indexPath.row].minOrderAmount)원"

            cell.rating.text = "★ "+"\(list[indexPath.row].reviewAvg ?? 0)"

//            cell.rating.text = "★ "+list[indexPath.row].reviewAvg

            cell.reviewCounts.text = "\(list[indexPath.row].reviewCount)"
            cell.id = list[indexPath.row].id
            let cesco = list[indexPath.row].tags.contains { (form:Category) -> Bool in
                if form.name == "excellent"{
                    cell.cescoImage.image = UIImage(named: "excellent")
                    return true
                }
                if form.name == "CESCO"{
                    cell.cescoImage.image = UIImage(named: "cesco")
                    return true
                }else{ return false}
                
            }
            
            
            
            
            let url = list[indexPath.row].logoURL
            
            //                    let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            Alamofire.request(url).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    let img = image
                    
                    //                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    cell.imageCollection.image = img
                    cell.imageCollection.clipsToBounds = true
                    cell.imageCollection.layer.cornerRadius = cell.imageCollection.frame.width / 2
                    cell.imageCollection.contentMode = .scaleAspectFit
                    //                            }
                    
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
            
            
            cell.selectionStyle = .none
            return cell
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
        case 0 : cell.label.text = "전체"
        case 1 : cell.label.text = "1인분주문"
        case 2 : cell.label.text = "치킨"
        case 3 : cell.label.text = "중국집"
        case 4 : cell.label.text = "피자/양식"
        case 5 : cell.label.text = "한식"
        case 6 : cell.label.text = "분식"
        case 7 : cell.label.text = "카페/디저트"
        case 8 : cell.label.text = "족발/보쌈"
        case 9 : cell.label.text = "일식/돈까스"
        case 10 : cell.label.text = "야식"
        case 11 : cell.label.text = "프랜차이즈"
        default: break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 5 , height: collectionView.bounds.height)
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
        indicatorViewLeadingConstraint.constant = (view.bounds.width / 5) * CGFloat(indexPath.row)
        indicatorView.widthAnchor.constraint(equalTo: cell.label.widthAnchor).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.customTabBar.layoutIfNeeded()
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        }, completion: nil)

        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.12, delay: 0, options: .curveLinear, animations: {
                self.mainScrollView.contentOffset.x = self.view.frame.width * CGFloat(indexPath.row)
            }, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else {return}
        cell.label.textColor = .lightGray
    }
}
extension ClassificationViewController : SendViewDelegate {
    func sendView(data: Int) {
        tagNumber = data
        print(tagNumber,"000")
        
    }
    
}
