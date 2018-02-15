//
//  ViewController.swift
//  Concentration
//
//  Created by Lukáš Voda on 10. 02.2018.
//  Copyright © 2018 Lukáš Voda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    lazy var concentration = makeConcentration()
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            concentration.flipCard(withIndex: cardNumber)
        } else {
            print("chosen card was not in cardButtons")
        }
        updateViewFromModel()
    }

    @IBAction func touchNewGame() {
        concentration = makeConcentration()
        emoji.removeAll(keepingCapacity: true)
        emojiChoices = CardTheme.randomTheme()

        updateViewFromModel()
    }

    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(concentration.flipCount)"
        scoreLabel.text = "Score: \(concentration.score)"

        for index in cardButtons.indices {
            let cardButton = cardButtons[index]
            let card = concentration.cards[index]
            updateCardButton(cardButton, fromModel: card)
        }
    }

    func updateCardButton(_ cardButton: UIButton, fromModel card: Card) {
        if (card.isFaceUp) {
            cardButton.setTitle(emoji(for: card), for: UIControlState.normal)
            cardButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            cardButton.setTitle("", for: UIControlState.normal)
            cardButton.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
    }

    func makeConcentration() -> Concentration {
        return Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    }

    var emojiChoices = CardTheme.randomTheme()
    var emoji = [Int:String]()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            emoji[card.identifier] = emojiChoices.remove(at: Int(arc4random_uniform(UInt32(emojiChoices.count))))
        }

        return emoji[card.identifier] ?? "?";
    }

}
