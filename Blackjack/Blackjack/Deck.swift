//
//  Deck.swift
//  Blackjack
//
//  Created by Korman Chen on 10/2/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation
import SpriteKit

class Deck
{
    let maxDeck = 52
    var deckImage: SKSpriteNode = SKSpriteNode()
    var listOfCards = [Card]()
    
    init()
    {
        var contents = try! FileManager.default.contentsOfDirectory(atPath: "/Users/kormanchen/Desktop/CS/Sprites/boardgamepack/PNG/Cards/deck")
        
        contents.remove(at: 0) // Remove .DS_Store w/ brute force for now
        contents.sort()
        
        for cardValue in 0..<maxDeck
        {
            listOfCards.append(Card(cardValue: cardValue + 1, cardImage: SKSpriteNode(imageNamed: contents[cardValue])))
        }
        
    }
    func generateCard() -> Card
    {
        let randCardIndex = arc4random_uniform(UInt32(listOfCards.count))
        let cardPicked = listOfCards.remove(at: Int(randCardIndex))
        
        return cardPicked
    }
}
