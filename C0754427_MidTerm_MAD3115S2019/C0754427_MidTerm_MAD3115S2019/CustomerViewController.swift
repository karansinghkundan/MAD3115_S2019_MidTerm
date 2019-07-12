//
//  CustomerListViewController.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    
    var customerList = [UsersStruct]()
    var customerArray = Array<Customer>()
  
    @IBOutlet weak var tblUsersName: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readCustomersPlistFile()
        
        
        let bill1: Mobile = Mobile(Id: 1, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 55.25, mobileManufacturer: "Nokia 1100", planName: "Talk and text", mobileNumber: "+12561458962", internetUsed: 0, minuteUsed: 56)
        let bill2: Mobile = Mobile(Id: 2, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 45.32, mobileManufacturer: "smsngs9", planName: "LTE  pitch plan", mobileNumber: "+14458515986", internetUsed: 67, minuteUsed: 456)
        
        let bill3: Internet = Internet(Id: 1, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 100.00, providerName: "Fido", internetUsed: 123)
        let bill4: Internet = Internet(Id: 2, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 200.02, providerName: "Freedom", internetUsed: 500)
        
        let bill5: Hydro = Hydro(Id: 1, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 1000.20, agencyName: "Planet Energy", unitconsumed: 120)
        let bill6: Hydro = Hydro(Id: 2, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 545.02, agencyName: "Energizer", unitconsumed: 111)
        
       
        let cust1: Customer = Customer(customerId: "1", firstName: "karan", lastName: "kundan", email: "karan@gmail.com")
        
        cust1.billDictionary[1] = bill1
        cust1.billDictionary[2] = bill3
        
        let cust2: Customer = Customer(customerId: "2", firstName: "priya", lastName: "Kaur", email: "Priya@gmail.com")
        
        cust2.billDictionary[1] = bill2
        cust2.billDictionary[2] = bill6
        cust2.billDictionary[3] = bill5
        
        let cust3: Customer = Customer(customerId: "3", firstName: "zack", lastName: "smith", email: "zack@gmail.com")
        
        cust3.billDictionary[1] = bill4
        
        
        let cust4: Customer = Customer(customerId: "4", firstName: "Shivani", lastName: "Dhiman", email: "Shivani@gmail.com")
        
        cust4.billDictionary[1] = bill3
        
        
        let cust5: Customer = Customer(customerId: "5", firstName: "Jazz", lastName: "kaur", email: "Jazz@gmail.com")
        
        cust5.billDictionary[1] = bill6
        
        customerArray = [cust1, cust2, cust3, cust4, cust5]
        self.tblUsersName.delegate = self
        self.tblUsersName.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "Info_detail", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["Users"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(UsersStruct(userId: id, name: firstName, email: email, password: password))
                }
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell")  as! UITableViewCell
        
        cell.textLabel?.text = self.customerArray[indexPath.row].fullName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBtnAction(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func tapBtnAction(_ sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
        Customer.activeCustomer = self.customerArray[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "GoToDetailS", sender: self)
    }
    
}
