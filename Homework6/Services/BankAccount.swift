//
//  BankAccount.swift
//  Homework6
//
//  Created by Andrii Klykavka on 30.11.2024.
//

import Foundation

final class BankAccount {
    
    private(set) var balance: Double = 0
    let lock = NSLock()
    
    @discardableResult
    func deposit(amount: Double) -> Bool {
        guard amount > 0 else {
            print("Unable to depist money.")
            return  false
        }
        self.balance += amount
        print("Successfully deposited \(amount).")
        return true
    }
    
    @discardableResult
    func withdraw(amount: Double) -> Bool {
        lock.lock() // 1 without these lock statements the threads could enter the function body untracked and pass the check while other withdrawals were also running
        defer { lock.unlock() } // 2
        guard amount > 0, amount <= self.balance else {
            print("Unable to withdraw money.")
            return false
        }
        sleep(UInt32.random(in: 0...5))
        self.balance -= amount
        print("Successfully withdrew \(amount).")
        return true
    }
    
    func resetBalance() {
        self.balance = 0
    }
}
