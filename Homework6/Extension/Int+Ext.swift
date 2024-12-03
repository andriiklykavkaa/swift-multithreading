//
//  Int+Ext.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import Foundation

extension Int {
    var isPrime: Bool {
        if self <= 3 { return true }
        var divider: Int = 2
        while divider * divider <= self {
            if self % divider == 0 {
                return false
            }
            divider += 1
        }
        return true
    }
}
