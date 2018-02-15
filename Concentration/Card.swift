//
//  Card.swift
//  Concentration
//
//  Created by Lukáš Voda on 10. 02.2018.
//  Copyright © 2018 Lukáš Voda. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func makeIdentifier() -> Int {
        identifierFactory += 1;
        return identifierFactory;
    }
    
    init() {
        self.identifier = Card.makeIdentifier();
    }
}
