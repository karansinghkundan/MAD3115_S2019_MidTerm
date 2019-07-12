//
//  ExtensionInt.swift
//  C0754427_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

extension Int
{
    public func unit() -> String
    {
        return String.init(format: "%d Units", self)
    }
    public func data() -> String
    {
        return String.init(format: "%d GB", self)
    }
    public func minutes() -> String
    {
        return String.init(format: "%d Minute(s)", self)
    }
}
