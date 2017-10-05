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
    var aceSeen: Bool
    
    init()
    {
        self.score = 0
        self.higherScore = 0
        self.aceSeen = false
    }
    
    func addCard(someCard: Card)
    {
        self.hand.append(someCard)
        self.score += someCard.value
        
        if(someCard.value == 1 && !aceSeen)
        {
            self.higherScore += 11
            return
        }
        
        self.higherScore += someCard.value
    }
    
    func emptyHand(deck: Deck)
    {
        for card in hand
        {
            deck.listOfCards.append(card)
        }
        
        score = 0
        higherScore = 0
    }
}
