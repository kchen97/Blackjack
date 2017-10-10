//
//  Game.swift
//  Blackjack
//
//  Created by Korman Chen on 10/9/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation
import SpriteKit

class Game {
    
    private var firstCardXSpawn = -195.00, cardYSpawnFixed = -330.00
    var yOffSetPlayer = -35.00, yOffSetDealer = 185.00
    var deck: Deck = Deck()
    
    init() {
        deck.deckImage = SKSpriteNode(imageNamed: "cardBack_red3.png") // Initialize deck
    }
    
    func labelConfig(somePlayer: Player, dealer: Player) {
        somePlayer.scoreLabel.position = CGPoint(x: -310.00, y: cardYSpawnFixed + yOffSetPlayer)
        dealer.scoreLabel.position = CGPoint(x: -310.00, y: cardYSpawnFixed + yOffSetDealer)
        
        somePlayer.scoreLabel.fontSize = CGFloat(48)
        dealer.scoreLabel.fontSize = CGFloat(48)
    }
    
    func dealFirstCards(somePlayer: Player, dealer: Player) -> [SKSpriteNode] { //Deals two cards to both players and then adds the image to firstcards, returns an array of all the images
        var firstCards = [SKSpriteNode]()
        
        firstCards.append(deal(somePlayer: somePlayer, nextCardOffset: somePlayer.nextCardOffSet, yOffSet: yOffSetPlayer))
        firstCards.append(deal(somePlayer: somePlayer, nextCardOffset: somePlayer.nextCardOffSet, yOffSet: yOffSetPlayer))
        firstCards.append(deal(somePlayer: dealer, nextCardOffset: dealer.nextCardOffSet, yOffSet: yOffSetDealer))
        firstCards.append(deal(somePlayer: dealer, nextCardOffset: dealer.nextCardOffSet, yOffSet: yOffSetDealer))
        firstCards.append(deck.deckImage)
        
        return firstCards
    }
    
    func deal(somePlayer: Player, nextCardOffset: Double, yOffSet: Double) -> SKSpriteNode { //Adds a random card to the players hand, then returns the cards image
        let newCard = deck.generateCard()
        newCard.image.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed + yOffSet)
        somePlayer.addCard(someCard: newCard)
        
        return newCard.image
    }
    
    func computeWinner(playerScore: Int, dealerScore: Int) -> String {
        if playerScore < 21 && dealerScore <= 21 {
            if playerScore > dealerScore {
                return "You Win!"
            }
            else {
                return "You Lose."
            }
        }
        
        return "You Win!"
    }
}
