//
//  PracticeGame.swift
//  Blackjack
//
//  Created by Korman Chen on 10/7/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class PracticeGameScene: SKScene {
    let firstCardXSpawn = -250.00, cardYSpawnFixed = -330.00
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var deck: Deck = Deck()
    var nextCardOffset = 0.00
    var player: Player = Player()
    
    override func didMove(to view: SKView) {
        
        deck.deckImage = SKSpriteNode(imageNamed: "cardBack_red3.png") // Initialize deck
        deck.deckImage.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        self.addChild(deck.deckImage)
        
        swipeRightRec.addTarget(self, action: #selector(PracticeGameScene.swipedRight)) // Initialize gestures
        swipeLeftRec.addTarget(self, action: #selector(PracticeGameScene.reset))
        tapRec.addTarget(self, action: #selector(PracticeGameScene.touchDown))
        
        swipeRightRec.direction = .right // Initialize label and recognizer properties
        swipeLeftRec.direction = .left
        tapRec.numberOfTapsRequired = 2
        scoreLabel.text = String(player.score)
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.minY)
        
        self.addChild(scoreLabel) // Add labels and all gesture recognizers
        self.view!.addGestureRecognizer(swipeRightRec)
        self.view!.addGestureRecognizer(swipeLeftRec)
        self.view!.addGestureRecognizer(tapRec)
    }
    
    func touchDown() {
        if(player.getState()) {
            addToHandAndView(aPlayer: player, yOffSet: 0.00)
        }
    }
    
    func addToHandAndView(aPlayer: Player, yOffSet: Double) {
        let newCard = deck.generateCard()
        newCard.image.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed + yOffSet)
        aPlayer.addCard(someCard: newCard) //Add card to player's hand
        
        nextCardOffset += 75.00
        self.addChild(newCard.image)
    }
    
    func reset() {
        if player.keepHand || player.score >= 21 { //Remove all nodes and add back default nodes
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
        scoreLabel.text = String(player.score)
    }
}
