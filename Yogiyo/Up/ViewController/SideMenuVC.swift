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

    @objc func loginTapped(_ sender: Any?) {
        self.performSegue(withIdentifier: "ShowLoginPage", sender: self)
        print("login tapped")
    }
    @objc func registerTapped(_ sender: Any?) {
        self.performSegue(withIdentifier: "ShowLoginPage", sender: self)
        print("login tapped")
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)

        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowLogin"), object: nil)
        case 1: performSegue(withIdentifier: "ShowAd", sender: nil)
        case 2: performSegue(withIdentifier: "goHome", sender: nil)
        case 3: print("not connected yet")
        default: break
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 100
        }
        
        return 70
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.isUserInteractionEnabled = true
        
            if indexPath.row == 0 {
                cell.textLabel!.text = "로그인 해 주세요!"
                cell.imageView?.image = UIImage(named: "user")
                cell.selectionStyle = .none
                


                    let button : UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
                    button.frame = CGRect(x:20, y:100, width:60, height:24)
                    button.center = CGPoint(x: 120, y: 80)
                    button.backgroundColor = UIColor.clear
                    button.setTitle("로그인", for: UIControl.State.normal)
                    button.layer.borderWidth = 1
                    button.layer.borderColor = UIColor.white.cgColor
                    button.titleLabel?.font =  UIFont.systemFont(ofSize: 12.0)
                    button.addTarget(self, action: #selector(SideMenuVC.loginTapped(_:)), for: .touchUpInside)

                
                    let button2 : UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
                    button2.frame = CGRect(x:20, y:100, width:60, height:24)
                    button2.center = CGPoint(x: 200, y: 80)
                    button2.backgroundColor = UIColor.clear
                    button2.setTitle("회원가입", for: UIControl.State.normal)
                    button2.layer.borderWidth = 1
                    button2.layer.borderColor = UIColor.white.cgColor
                    button2.titleLabel?.font =  UIFont.systemFont(ofSize: 12.0)
                    button2.addTarget(self, action: #selector(SideMenuVC.registerTapped(_:)), for: .touchUpInside)
                
                
                    cell.addSubview(button)
                    cell.addSubview(button2)
                return cell
                
            } else if indexPath.row == 1 {
                
                
                
                let adImg : UIImageView = UIImageView(frame: CGRect(x:0, y:0, width: 300, height:70))
                adImg.image = UIImage(named: "ad")
                cell.addSubview(adImg)
                
            
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
