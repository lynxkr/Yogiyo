//
//  SignUpViewController.swift
//  Yogiyo
//
//  Created by 김지훈 on 03/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBAction func singUpButton(_ sender: Any) {
        print("111")
        let signUpRequest  = [
            "username" : self.emailAdress.text! as String,
            "password" : self.password.text! as String
        ]
        print(signUpRequest)
        let serverUrl = "https://jogiyo.co.kr" + "/members/api/user/"
        Alamofire.request(serverUrl, method: .post, parameters: signUpRequest, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            switch response.result {
            case .success(let data):
                print("signup success")
                print(data)
                
            case .failure(let error):
                print("Request failed with error: \(error.localizedDescription)")
            }
        
    }
    
}
    @IBOutlet var password: UITextField!
    @IBOutlet var emailAdress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
