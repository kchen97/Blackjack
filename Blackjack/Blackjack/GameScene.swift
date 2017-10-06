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
    
    let firstCardXSpawn = -250.00, cardYSpawnFixed = -355.00
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var deck: Deck = Deck()
    var nextCardOffset = 0.00
    var player: Player = Player()
    
    override func didMove(to view: SKView) {
        
        deck.deckImage = SKSpriteNode(imageNamed: "cardBack_red3.png") // Initialize deck
        self.addChild(deck.deckImage)
        
        swipeRightRec.addTarget(self, action: #selector(GameScene.swipedRight)) // Initialize gestures
        swipeLeftRec.addTarget(self, action: #selector(GameScene.reset))
        tapRec.addTarget(self, action: #selector(GameScene.touchDown))
        
        swipeRightRec.direction = .right // Initialize label and recognizer properties
        swipeLeftRec.direction = .left
        tapRec.numberOfTapsRequired = 2
        scoreLabel.text = "Score: " + String(player.score)
        scoreLabel.position = CGPoint(x: frame.maxX - 100.00, y: frame.minY)
        
        self.addChild(scoreLabel) // Add score label and all gesture recognizers
        self.view!.addGestureRecognizer(swipeRightRec)
        self.view!.addGestureRecognizer(swipeLeftRec)
        self.view!.addGestureRecognizer(tapRec)
    }
    
    func touchDown() {
        if(player.getState()) {
            let newCard = deck.generateCard()
            newCard.image.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed)
            player.addCard(someCard: newCard) //Add card to player's hand
            
            nextCardOffset += 75.00
            self.addChild(newCard.image)
        }
    }
    
    func reset() {
        if player.keepHand {
            player.emptyHand(deck: deck)
            self.removeAllChildren()
            self.addChild(deck.deckImage)
            self.addChild(scoreLabel)
            self.nextCardOffset = 0.00
        }
    }
    
    func swipedRight() {
        player.keepHand = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        scoreLabel.text = "Score: " + String(player.score)
    }
}
