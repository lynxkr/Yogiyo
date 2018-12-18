//
//  SelectionViewController.swift
//  Yogiyo
//
//  Created by Kira on 11/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SelectionViewController: UIViewController {
    var foodData: [Food] = []
    var countMenu = 0
    var minOrder = 0
    private var sumPrice = 0 {
        didSet {
            selectionTableView.reloadData()
        }
    }
    
    private let selectionTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
    private let selectionPaymentView = SelectionPaymentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumPrice = foodData[0].price
        
        configure()
        configureLayout()
        
    }
    
    private func configure() {
        selectionTableView.dataSource = self
        selectionTableView.delegate = self
        selectionTableView.allowsSelection = false
        selectionTableView.sectionHeaderHeight = 0
        selectionTableView.sectionFooterHeight = 2
        selectionTableView.contentInsetAdjustmentBehavior = .never
        selectionTableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        selectionTableView.register(SelectionInfoTableViewCell.self, forCellReuseIdentifier: "SelectionInfoTableViewCell")
        selectionTableView.register(SelectionPriceTableViewCell.self, forCellReuseIdentifier: "SelectionPriceTableViewCell")
        selectionTableView.register(SelectionAmountTableViewCell.self, forCellReuseIdentifier: "SelectionAmountTableViewCell")
        selectionTableView.register(SelectionSumTableViewCell.self, forCellReuseIdentifier: "SelectionSumTableViewCell")
        view.addSubview(selectionTableView)
        
        selectionPaymentView.delegate = self
        view.addSubview(selectionPaymentView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let selectionPaymentViewHeight: CGFloat = 50
    }
    
    private func configureLayout() {
        selectionTableView.translatesAutoresizingMaskIntoConstraints = false
        selectionTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selectionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        selectionTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        selectionTableView.bottomAnchor.constraint(equalTo: selectionPaymentView.topAnchor).isActive = true
        
        selectionPaymentView.translatesAutoresizingMaskIntoConstraints = false
        selectionPaymentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        selectionPaymentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        selectionPaymentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        selectionPaymentView.heightAnchor.constraint(equalToConstant: Standard.selectionPaymentViewHeight).isActive = true
    }
}

extension SelectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionInfoTableViewCell") as! SelectionInfoTableViewCell
            var img = Image()
            guard let url = foodData[0].image else {return cell}
            Alamofire.request(url).responseImage { response in
                switch response.result {
                case .success(_): if let image = response.result.value {
                    img = image
                    }
                case .failure(let err) : print("에러: \(err)")
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                cell.menuImageView.image = img
            }
            cell.titleLabel.text = foodData[0].name
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionPriceTableViewCell") as! SelectionPriceTableViewCell
            cell.priceLabel.text = String(foodData[0].price) + "원"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionAmountTableViewCell") as! SelectionAmountTableViewCell
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionSumTableViewCell") as! SelectionSumTableViewCell
            cell.price = sumPrice
            cell.noticeLabel.text = "최소주문금액 \(minOrder)원"
            return cell
        }
    }
    
    
}

extension SelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }
}

extension SelectionViewController: SelectionPaymentViewDelegate {
    func buttonDidTap(sender: UIButton) {
        print("---------------------- [ \(sender.currentTitle!) ] ----------------------\n")
//        let item = foodData[0].price
        let menuitem = foodData[0].name
        if sender.tag == 1 {
            SettingData.shared.cartPrice.append(sumPrice)
            SettingData.shared.cartMenu.append((menuitem,countMenu))
            let VC = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "Cart") as UIViewController
            self.present(VC, animated: false, completion: nil)
        }
        if sender.tag == 0 {
            SettingData.shared.cartPrice.append(sumPrice)
            SettingData.shared.cartMenu.append((menuitem,countMenu))
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension SelectionViewController: SelectionAmountTableViewCellDelegate {
    func amonutButtonDidTap(count: Int) {
        sumPrice = foodData[0].price * count
        countMenu = count
    }
}
