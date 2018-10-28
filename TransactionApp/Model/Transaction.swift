//
//  Transaction.swift
//  TransactionApp
//
//  Created by jose.sanchezporro on 28/10/2018.
//  Copyright © 2018 jose.sanchezporro. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let id: Int?
    let date: String?
    let amount: Double?
    let fee: Double?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case date
        case amount
        case fee
        case description
    }
}
