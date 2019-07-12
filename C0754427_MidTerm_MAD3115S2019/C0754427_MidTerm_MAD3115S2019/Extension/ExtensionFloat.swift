//
//  ExtensionFloat.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
extension Float
{
    public func currency() -> String
    {
        return String(format: "$%0.2f", self)
    }
    public func formatUnits() -> String
    {
        return String(format : "%0.0f units", self)
    }
    public func formatGb() -> String
    {
        return String(format : "%0.0f GB", self)
    }
}		
