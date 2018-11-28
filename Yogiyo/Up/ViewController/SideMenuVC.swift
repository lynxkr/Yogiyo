//
//  SideMenuVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//


import UIKit

class SideMenuVC: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)



    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
         NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowLogin"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowCoupon"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowReview"), object: nil)
        default: break
        }
        
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        
        if indexPath.row == 0 {
            cell.textLabel!.text = "로그인 해 주세요"
        } else if indexPath.row == 1 {
             cell.textLabel!.text = "광고"
        } else if indexPath.row == 2 {
             cell.textLabel!.text = "요기요 홈"
        } else if indexPath.row == 3 {
             cell.textLabel!.text = "쿠폰함"
        } else if indexPath.row == 4 {
            cell.textLabel!.text = "비회원 주문내역"
        } else if indexPath.row == 5 {
            cell.textLabel!.text = "리뷰관리"
        } else if indexPath.row == 6 {
            cell.textLabel!.text = "요기요 추천하기"
        } else if indexPath.row == 7 {
            cell.textLabel!.text = "이벤트 및 공지사항"
        }
        
        
        return cell
    }
    
    
}
