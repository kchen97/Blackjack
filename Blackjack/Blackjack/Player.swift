//
//  Player.swift
//  Blackjack
//
//  Created by Korman Chen on 10/5/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation
import SpriteKit

class Player
{
    var hand = [Card]()
    var score: Int
    var higherScore: Int
    var nextCardOffSet = 0.00
    var aceSeen: Bool
    var keepHand: Bool
    var scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    init() {
        self.score = 0
        self.higherScore = 0
        self.aceSeen = false
        self.keepHand = false
        self.scoreLabel.text = String(score)
    }
    
    func addCard(someCard: Card) {
        self.hand.append(someCard)
        self.score += someCard.value
        
        if(someCard.value == 1 && !aceSeen) {
            self.higherScore += 11
        }
        else {
            self.higherScore += someCard.value
        }
        
        if higherScore == 21 {
            self.score = higherScore
        }
        
        nextCardOffSet += 75.00
    }
    
    func emptyHand(deck: Deck) {
        for card in hand {
            deck.listOfCards.append(card)
        }
        
        score = 0
        higherScore = 0
        nextCardOffSet = 0.00
        scoreLabel.text = String(score)
        aceSeen = false
        keepHand = false
    }
    
    func getState() -> Bool {
        return score < 21 && !keepHand
    }
    
    func getScore() -> Int {
        
        if higherScore <= 21 {
            return higherScore
        }
        
        return score
    }
}
