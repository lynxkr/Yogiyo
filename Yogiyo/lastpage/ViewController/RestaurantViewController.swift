//
//  RestaurantViewController.swift
//  TableViewYogiyo
//
//  Created by Kira on 28/11/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

struct recommendMenu {
    var image = String()
    var name = String()
    var price = Int()
}

class RestaurantViewController: UIViewController {
    var restaurantId: Int?
    
    lazy var menuData: [MenuElement] = {
        var menu = [MenuElement]()
        return menu
    }()
    
    lazy var reviewData: Review = {
        var review = [ReviewElement]()
        return review
    }()
    
    let infoTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
    private let paymentView = PaymentView()
    
    private let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 320))
    private let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    
    private var tableViewData = [cellData]()
    private var recommendMenuData = [recommendMenu]()
    
    private var categoryTag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [
            cellData(opened: false, title: "Title1", sectionData: ["1-1", "1-2", "1-3"]),
            cellData(opened: false, title: "Title2", sectionData: ["2-1", "2-2", "2-3", "2-4"]),
            cellData(opened: false, title: "Title3", sectionData: ["3-1", "3-2"]),
            cellData(opened: false, title: "Title4", sectionData: ["4-1", "4-2", "4-3"]),
            cellData(opened: false, title: "Title5", sectionData: ["5-1", "5-2"]),
            cellData(opened: false, title: "Title6", sectionData: ["6-1", "6-2", "6-3"]),
            cellData(opened: false, title: "Title7", sectionData: ["7-1", "7-2", "7-3", "7-4"]),
            cellData(opened: false, title: "Title8", sectionData: ["8-1", "8-2", "8-3"])
        ]
        
//        recommendMenuData = [
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000),
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000),
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000),
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000),
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000),
//            recommendMenu(image: UIImage(named: "족발")!, name: "성수족발", price: 26000)
//        ]
        
        
        dataPass(id: restaurantId ?? 0)
        configure()
        configureLayout()
        cellOfReview()
    }
    
    private func dataPass(id: Int) {
        Alamofire.request("https://jogiyo.co.kr/restaurants/api/\(id)/menu/").responseData(completionHandler: { response in
            if let jsonData = response.result.value {
                let result = try? JSONDecoder().decode(Menu.self, from: jsonData)
                self.menuData = result!
            }
            
//            for i in 0..<self.menuData[0].food.count {
//                self.recommendMenuData.append(recommendMenu(
//                    image: self.menuData[0].food[i].image!,
//                    name: self.menuData[0].food[i].name,
//                    price: self.menuData[0].food[i].price))
//            }
            
            self.infoTableView.reloadData()
        })
        
    }
    
    private func configure() {
        let resNib = UINib(nibName: "ReviewTableViewCell", bundle: nil)

        headerView.categoryButtonsView.deldgate = self
        
        infoTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        infoTableView.sectionHeaderHeight = 3
        infoTableView.sectionFooterHeight = 3
        infoTableView.tableHeaderView = headerView
        footerView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        infoTableView.tableFooterView = footerView
        infoTableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        infoTableView.delegate = self
        infoTableView.dataSource = self
        // 메뉴 셀
        infoTableView.register(RecommendMenuViewCell.self, forCellReuseIdentifier: "RecommendMenuViewCell")
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        infoTableView.register(resNib, forCellReuseIdentifier: "ReviewTableViewCell")
        
        // 리뷰 셀
        infoTableView.register(RatingTableViewCell.self, forCellReuseIdentifier: "RatingTableViewCell")
        infoTableView.register(ReviewTopTableViewCell.self, forCellReuseIdentifier: "ReviewTopTableViewCell")
        
        view.addSubview(infoTableView)
        
        view.addSubview(paymentView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let paymentViewHeight: CGFloat = 50
    }
    
    private func configureLayout() {
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        infoTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        infoTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        infoTableView.bottomAnchor.constraint(equalTo: paymentView.topAnchor).isActive = true
        
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        paymentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        paymentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        paymentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        paymentView.heightAnchor.constraint(equalToConstant: Standard.paymentViewHeight).isActive = true
        
    }
    
    func cellOfReview(){
        print(restaurantId,",1111")
        Alamofire.request("https://jogiyo.co.kr/restaurants/api/\(restaurantId!)/review/", method: .get
            , encoding: JSONEncoding.default).responseData { response in
                
                debugPrint(response)
                
                if let jsonData = response.result.value {
                    let result = try? JSONDecoder().decode(Review.self, from: jsonData)
                    
                    
                    self.reviewData = result!
                }
                
                 self.infoTableView.reloadData()
        }
    }
}

extension RestaurantViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch categoryTag {
        case 0:
            return menuData.count + 1
        case 1:
            return 2
        default:
            return 2
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch categoryTag {
        case 0:
            if section == 0 {
                return 1
            } else {
                if tableViewData[section - 1].opened == true {
                    return tableViewData[section - 1].sectionData.count + 1
                } else {
                    return 1
                }
            }
        case 1:
            if section == 0 {
                return 1
            } else {
                return 10
            }
        default:
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch categoryTag {
        case 0:
            let dataIndex = indexPath.row - 1
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendMenuViewCell") as! RecommendMenuViewCell
                cell.recommendMenuData = recommendMenuData
                return cell
            } else {
                if indexPath.row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") else {return UITableViewCell()}
                    cell.textLabel?.text = menuData[indexPath.section-1].name
//                        tableViewData[indexPath.section - 1].title
                    
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") else {return UITableViewCell()}
                    cell.textLabel?.text = menuData[indexPath.section-1].food[dataIndex].name
//                        tableViewData[indexPath.section - 1].sectionData[dataIndex]
                    return cell
                }
            }
        case 1:
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableViewCell") as! RatingTableViewCell
                return cell
            } else {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTopTableViewCell") as! ReviewTopTableViewCell
                    cell.delegete = self
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath)  as! ReviewTableViewCell
                    cell.idLabel.text = reviewData[indexPath.row].user.username.rawValue
                    cell.commentLabel.text = reviewData[indexPath.row].comment
                   
                    return cell
                }
                
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.textLabel?.text = "\(indexPath.section) --- \(indexPath.row)"
            return cell
        }
    }
}

extension RestaurantViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch categoryTag {
        case 0:
            if indexPath.section == 0 {
                return 200
            } else {
                if indexPath.row == 0 {
                    return 50
                } else {
                    return 100
                }
            }
        case 1:
            if indexPath.section == 0 {
                return 100
            } else {
                if indexPath.row == 0 {
                    return 50
                } else {
                    return 148
                }
            }
        default:
            if indexPath.section == 0 {
                return 100
            } else {
                return 100
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch categoryTag {
        case 0:
            if indexPath.section == 0 {
            } else {
                if indexPath.row == 0 {
                    if tableViewData[indexPath.section - 1].opened == true {
                        tableViewData[indexPath.section - 1].opened = false
                        let sections = IndexSet.init(integer: indexPath.section)
                        tableView.reloadSections(sections, with: UITableView.RowAnimation.automatic)
                    } else {
                        tableViewData[indexPath.section - 1].opened = true
                        let sections = IndexSet.init(integer: indexPath.section)
                        tableView.reloadSections(sections, with: UITableView.RowAnimation.automatic)
                    }
                } else {
                    print("HI")
                }
            }
        case 1:
            break
        default:
            break
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
//
//        if scrollView.contentOffset.y > 250 {
//            headerView.guidanceCategoryButtonViewTop?.priority = UILayoutPriority(999)
//        } else {
//            headerView.guidanceCategoryButtonViewTop?.priority = .defaultLow
//        }
//        infoTableView.layoutIfNeeded()
//    }
}

extension RestaurantViewController: CategoryButtonsViewDelegate {
    func categoryChange(sender: UIButton) {
        categoryTag = sender.tag
        infoTableView.reloadData()
    }
}

extension RestaurantViewController: ReviewTopTableViewCellDelegate {
    func photoSwitchValueChageed(sender: Bool) {
        print(sender)
    }
}

extension RestaurantViewController : SendDataDelegate {
    func sendData(data: Int) {
        restaurantId = data
    }
    
}
