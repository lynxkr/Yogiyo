//
//  LoginViewController.swift
//  Yogiyo
//
//  Created by 김지훈 on 27/11/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit
import Alamofire
import KakaoOpenSDK

class LoginViewController: UIViewController {

    @IBOutlet var emailAdress: UITextField!
    @IBOutlet var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func normalLogin(_ sender: Any) {
        print("111")
        let loginRequest  = [
            "username" : self.emailAdress.text! as String,
            "password" : self.password.text! as String
        ]
        print(loginRequest)
        let serverUrl = "https://jogiyo.co.kr" + "/api-token-auth/"
        Alamofire.request(serverUrl, method: .post, parameters: loginRequest, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
            .responseJSON { response in
            print(response.response?.statusCode)
            switch response.result {
            case .success(let data):
                print("login success")
                print(data)
         
            case .failure(let error):
            print("Request failed with error: \(error.localizedDescription)")
        }
    }
        
    }
    @IBAction func kakaoLogin(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
        
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler: { error in
            if !session.isOpen(){
                if let error = error as NSError? {
                    switch error.code{
                    case Int(KOErrorCancelled.rawValue):
                        print("cancel")
                    default:
                        print(error.localizedDescription)
                    }
                }
            }else{
                print("login sucess")
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
    }

    
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.navigationBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
