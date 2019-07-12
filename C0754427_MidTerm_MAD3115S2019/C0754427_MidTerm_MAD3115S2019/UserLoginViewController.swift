//
//  UserLoginViewController.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var txtemailId: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    
    
    @IBOutlet weak var switchRemember: UISwitch!
    var UsersDict = [UsersStruct]()
    
    // getting user defaults reference
    let userDefault = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        switchRemember.isOn = false
        getRememberMe()
        readCustomersPlistFile()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_login(_ sender: Any)
    {
        
        
        if let email = txtemailId.text{
            if !email.isEmpty{
                
                if email.isVAlidEmail(){
                    if let password = txtpassword.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                                if  checkEmailPassword(email: email, password: password) {
                                    setRememberMe()
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let dashboardVC = storyboard.instantiateViewController(withIdentifier: "customerListVC") as! CustomerListViewController
                                    
                                    self.navigationController?.pushViewController(dashboardVC, animated: true)
                                    
                                    
                                }else{
                                    showAlerBox(msg: "You have enter wrong credentials")
                                }
                                
                            }else{
                                showAlerBox(msg: "Invalid password size")
                            }
                            
                        }else{
                            showAlerBox(msg: "Please enter password")
                        }
                    }
                }
                else{
                    showAlerBox(msg: "Please enter valid email")
                }
            }else{
                showAlerBox(msg: "Please enter useremail")
            }
        }
    }
    
    
    
    func showAlerBox(msg : String)  {
        let alertController = UIAlertController(title: "CustomerBillApp", message:
            msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "Info_detail", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let Customers = dict["User"] as? [[String:Any]]
            {
                for customer in Customers {
                    let id = customer["userId"] as! Int
                    let firstName = customer["name"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.UsersDict.append(UsersStruct(userId: id, name: firstName, email: email, password: password))
                    //self.UsersDict.append(UsersStruct(userID: <#T##Int#>, userName: <#T##String#>, email: <#T##String#>, password: <#T##String#>))
                }
            }
        }
        
    }
    func checkEmailPassword(email : String , password : String) -> Bool{
        
        for everyCustomer in UsersDict{
            if (everyCustomer.email == email && everyCustomer.password == password) {
                return true
            }
        }
        return false
    }
    
    func setRememberMe()  {
        if switchRemember.isOn {
            userDefault.set(self.txtemailId.text, forKey: "email")
            userDefault.set(self.txtpassword.text, forKey: "password")
        }else{
            userDefault.set("", forKey: "email")
            userDefault.set("", forKey: "password")
        }
    }
    
    func getRememberMe()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "email")
        {
            txtemailId.text = email
            
            if let password = userDefault.string(forKey: "password")
            {
                txtpassword.text = password
                switchRemember.setOn(true, animated: false)
            }
        }
    }
   
}
