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
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Card_Images.bundle")
        let urls = try! FileManager.default.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
        var contents = [String]()
        
        for url in urls
        {
            contents.append(url.lastPathComponent)
        }
        
        contents.sort()
        
        for cardValue in 0..<maxDeck
        {
            let node = SKSpriteNode(imageNamed: contents[cardValue])
            node.name = String(contents[cardValue])
            listOfCards.append(Card(cardValue: cardValue + 1, cardImage: node))
        }
        
    }
    func generateCard() -> Card
    {
        let randCardIndex = arc4random_uniform(UInt32(listOfCards.count))
        let cardPicked = listOfCards.remove(at: Int(randCardIndex))
        
        return cardPicked
    }
}
