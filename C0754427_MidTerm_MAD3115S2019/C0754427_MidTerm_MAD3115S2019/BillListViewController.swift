//
//  BillListViewController.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class BillListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var lblCustomerID: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblCustomerEmail: UILabel!
    
    @IBOutlet weak var lblTotalBill: UILabel!
    
    
    @IBOutlet weak var tblBillsDetails: UITableView!
    
    
    override func viewDidLoad() {
        self.tblBillsDetails.delegate = self
        self.tblBillsDetails.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lblCustomerID.text = Customer.activeCustomer.customerId
        self.lblCustomerEmail.text = Customer.activeCustomer.email
        self.lblCustomerName.text = Customer.activeCustomer.fullName
        self.lblTotalBill.text = Customer.activeCustomer.TotalAmountToPay.currency()
    }
    
    @IBAction func btn_addNewItem(_ sender: Any) {
        self.performSegue(withIdentifier: "goToNewBill", sender: nil)
    }
    
    @IBAction func btn_backClick(_ sender: UIBarButtonItem)
    {
        self.performSegue(withIdentifier: "goBack", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Customer.activeCustomer.billDictionary.count
    }
    
    @IBAction func btn_back(_ sender: Any)
    {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idBill")  as! UITableViewCell
        
        let currentbill = Customer.activeCustomer.billDictionary[indexPath.row + 1]
        var furtherDetails = ""
        if currentbill?.billType == billTypes.Mobile{
            cell.textLabel?.numberOfLines = 12
            let mobileBill = currentbill as! Mobile
            furtherDetails = "\nManufacturer Name : \(mobileBill.mobileManufacturer) \nPlan Name : \(mobileBill.planName) \nMobile Number : \(mobileBill.mobileNumber) \nInternet used : \(mobileBill.internetUsed.data()) \nMinutes Used : \(mobileBill.minuteUsed.minutes()) "
        } else {
            if currentbill?.billType == billTypes.Hydro{
                cell.textLabel?.numberOfLines = 12
                let hydroBill = currentbill as! Hydro
                furtherDetails = "Agency Name : \(hydroBill.agencyName) \nUnit Consumed : \(hydroBill.unitconsumed.unit())"
            } else {
                if currentbill?.billType == billTypes.Internet{
                    cell.textLabel?.numberOfLines = 12
                    let internetBill = currentbill as! Internet
                    furtherDetails = "Provider Name : \(internetBill.providerName) \nInternet Used : \(internetBill.internetUsed.data())"
                }
            }
        }
        cell.textLabel?.text = "Bill ID : \(String(describing: currentbill!.Id)) \nBill Date : \(String(describing: currentbill!.billDate.getForamttedDate())) \nBill Type : \(String(describing: currentbill!.billType)) \nBill Total : \(String(describing: currentbill!.totalBillAmount.currency())) \(furtherDetails)"
        return cell
    }
    
}





