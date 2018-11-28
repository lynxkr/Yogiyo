//
//  SideMenuVC.swift
//  Yogiyo
//
//  Created by EunKyung Park on 11/27/18.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//


import UIKit

class SideMenuVC: UITableViewController {
    
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
    
    
    
    
}
