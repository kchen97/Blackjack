//
//  GameScene.swift
//  Blackjack
//
//  Created by Korman Chen on 10/1/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var deck: Deck = Deck()
    let firstCardXSpawn = -250.00, cardYSpawnFixed = -355.00
    var nextCardOffset = 0.00
    var player: Player = Player()
    
    override func didMove(to view: SKView) {
        
        deck.deckImage = SKSpriteNode(imageNamed: "cardBack_red3.png")
        self.addChild(deck.deckImage)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        var newCard = deck.generateCard()
        newCard.image.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed)
        player.addCard(someCard: newCard) //Add card to player's hand
        
        nextCardOffset += 75.00
        self.addChild(newCard.image)
    }
    
    func reset()
    {
        player.emptyHand(deck: deck)
        self.removeAllChildren()
        self.addChild(deck.deckImage)
        self.nextCardOffset = 0.00
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if player.score >= 21 || player.higherScore == 21
        {
            print("Score: \(player.score), Higher Score: \(player.higherScore)")
            reset()
        }
    }
}
