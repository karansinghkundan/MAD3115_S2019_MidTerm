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
    
   
