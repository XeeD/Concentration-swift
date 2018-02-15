//
//  Concentration.swift
//  Concentration
//
//  Created by Lukáš Voda on 10. 02.2018.
//  Copyright © 2018 Lukáš Voda. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var seenCards = [Int:Bool]()
    var flipCount = 0
    var score = 0
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        var newCards = cards
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            newCards += [card, card]
        }
        for _ in newCards.indices {
            cards.append(newCards.remove(at: Int(arc4random_uniform(UInt32(newCards.count)))))
        }
    }
    
    func flipCard(withIndex index: Int) {
        if index != indexOfOneAndOnlyFaceUpCard, !cards[index].isMatched {
            
            flipCount += 1
        }

        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if seenCards[index] == true {
                        score -= 1
                    }
                    if seenCards[matchedIndex] == true {
                        score -= 1
                    }
                }
                seenCards[index] = true
                seenCards[matchedIndex] = true
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // 0 or 2 cards are face up currently
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

}
