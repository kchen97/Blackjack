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

class DealerGameScene: SKScene {
    
    let firstCardXSpawn = -250.00, cardYSpawnFixed = -330.00
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var stateLabel = SKLabelNode(fontNamed: "Chalkduster")
    var deck: Deck = Deck()
    var nextCardOffset = 0.00
    var player: Player = Player()
    var dealer: Player = Player()
    
    override func didMove(to view: SKView) {
        
        deck.deckImage = SKSpriteNode(imageNamed: "cardBack_red3.png") // Initialize deck
        deck.deckImage.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        self.addChild(deck.deckImage)
        
        swipeRightRec.addTarget(self, action: #selector(DealerGameScene.swipedRight)) // Initialize gestures
        swipeLeftRec.addTarget(self, action: #selector(DealerGameScene.reset))
        tapRec.addTarget(self, action: #selector(DealerGameScene.touchDown))
        
        swipeRightRec.direction = .right // Initialize label and recognizer properties
        swipeLeftRec.direction = .left
        tapRec.numberOfTapsRequired = 2
        scoreLabel.text = String(player.score)
        stateLabel.text = String("Your Turn")
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.minY)
        stateLabel.position = CGPoint(x: frame.midX, y: frame.midY + 200)
        
        self.addChild(scoreLabel) // Add labels and all gesture recognizers
        self.addChild(stateLabel)
        self.view!.addGestureRecognizer(swipeRightRec)
        self.view!.addGestureRecognizer(swipeLeftRec)
        self.view!.addGestureRecognizer(tapRec)
    }
    
    func touchDown() {
        if(player.getState()) {
            addToHandAndView(aPlayer: player, yOffSet: -35.00)
        }
    }
   
    func addToHandAndView(aPlayer: Player, yOffSet: Double) {
        let newCard = deck.generateCard()
        newCard.image.position = CGPoint(x: firstCardXSpawn + nextCardOffset, y: cardYSpawnFixed + yOffSet)
        aPlayer.addCard(someCard: newCard) //Add card to player's hand
        
        nextCardOffset += 75.00
        self.addChild(newCard.image)
    }
    
    func dealerTurn(score: Int) {
        if score > 21 {
            stateLabel.text = "Bust."
        }
        else if score == 21 {
            stateLabel.text = "You win!"
        }
        else {
            stateLabel.text = "Dealer Turn"
            nextCardOffset = 0.00
            while dealer.score < score {
                addToHandAndView(aPlayer: dealer, yOffSet: 185.00)
            }
            
            if dealer.score < 21 && dealer.score > score {
                stateLabel.text = "You Lose."
            }
            else if dealer.score == score {
                stateLabel.text = "Tie."
            }
            else {
                stateLabel.text = "You Win!"
            }
        }
    }
    
    func reset() {
        if player.keepHand || player.score >= 21 { //Remove all nodes and add back default nodes
            stateLabel.text = "Your Turn"
            player.emptyHand(deck: deck)
            dealer.emptyHand(deck: deck)
            self.removeAllChildren()
            self.addChild(deck.deckImage)
            self.addChild(scoreLabel)
            self.addChild(stateLabel)
            self.nextCardOffset = 0.00
        }
    }
    
    func swipedRight() {
        player.keepHand = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        scoreLabel.text = String(player.score)
        if !player.getState()
        {
            dealerTurn(score: player.score)
        }
    }
}
