//
//  ExtensionDate.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
extension Date
{
    public func getForamttedDate() -> String
    {
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        // in the format "Thursday, 20 june, 2019
        var formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}
