//
//  ResourceRaceController.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import UIKit
import SnapKit

class ResourceRaceController: UIViewController {
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Run Races", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bankAccount: BankAccount
    
    init(bankAccount: BankAccount) {
        self.bankAccount = bankAccount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        actionButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func actionButtonTapped() {
        let numberOfThreads = 6
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        bankAccount.deposit(amount: 100)
        
        for _ in 0..<numberOfThreads {
            group.enter()
            queue.async {
                self.bankAccount.withdraw(amount: 30)
                group.leave()
            }
        }
        
        group.wait()
        print("Balance: \(bankAccount.balance)")
        bankAccount.resetBalance()
    }
}
