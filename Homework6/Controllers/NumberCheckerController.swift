//
//  ViewController.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import UIKit
import SnapKit

class NumberCheckerController: UIViewController {
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    private let numberChecker: NumberCheckerService
    
    init(numberCheckerService: NumberCheckerService) {
        self.numberChecker = numberCheckerService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try self.numberChecker.loadNumbers(from: "numbers")
            } catch {
                print(error.localizedDescription)
            }
        }
        
        view.backgroundColor = .white
        layout()
        actionButton.addTarget(self, action: #selector(filterPrimeNumbers), for: .touchUpInside)
    }
    
    @objc private func filterPrimeNumbers() {
        let primeNumbers = self.numberChecker.filterPrimeNumbers()
        print("Prime numbers count: \(primeNumbers.count)")
    }
    
    private func layout() {
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
}
