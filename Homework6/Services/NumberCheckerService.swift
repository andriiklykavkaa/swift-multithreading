//
//  NumberCheckerService.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import Foundation

protocol NumberCheckerService {
    func loadNumbers(from fileName: String) throws
    func getNumbers() -> [Int]
    func filterPrimeNumbers() -> [Int]
}

final class NumberChecker: NumberCheckerService {
    
    private var numbers: [Int] = []
    
    func loadNumbers(from fileName: String) throws {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
            throw NSError(domain: "Sevice", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
        
        do {
            let data = try String(contentsOf: fileURL, encoding: .utf8)
            self.numbers = data.split(separator: "\t").compactMap { Int($0) }
            print("Loaded")
        } catch {
            throw NSError(domain: "Service", code: 404, userInfo: [NSLocalizedDescriptionKey: "Unable to load numbers"])
        }
    }
    
    func filterPrimeNumbers() -> [Int] {
        let threadNumber = min(Int(self.numbers.count / 1000), 8)
        let chunkSize = self.numbers.count / threadNumber
        var primeNumbers: [Int] = []
        
        let queue = DispatchQueue.global()
        let syncQueue = DispatchQueue(label: "syncQueue")
        let group = DispatchGroup()
        
        for index in 0..<threadNumber {
            let start = index * chunkSize
            let end = (index == threadNumber - 1 ?
                       self.numbers.count : (index + 1) * chunkSize) - 1
            group.enter()
            queue.async {
                print("Queue \(index) started.")
                let chunk = Array(self.numbers[start...end])
                var localPrimes: [Int] = []
                for number in chunk where number.isPrime {
                        localPrimes.append(number)
                }
                
                syncQueue.async {
                    primeNumbers.append(contentsOf: localPrimes)
                }
                print("Queue \(index) finished.")
                group.leave()
            }
        }
        
        group.wait()
        return primeNumbers
    }
}
