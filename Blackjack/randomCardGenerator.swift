//
//  randomCardGenerator.swift
//  Blackjack
//
//  Created by Korman Chen on 10/2/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation
import SpriteKit

class randomCardGenerator
{
    var listOfCards = [SKSpriteNode]()
    
    init()
    {
        var contents = try! FileManager.default.contentsOfDirectory(atPath: "/Users/kormanchen/Desktop/CS/Sprites/boardgamepack/PNG/Cards/deck")
        
        contents.remove(at: 0) // Remove .DS_Store w/ brute force for now
        
        for images in contents
        {
            //print(images)
            listOfCards.append(SKSpriteNode(imageNamed: images))
        }
        
    }
    
    func generateCard() -> SKSpriteNode
    {
        let randCardIndex = arc4random_uniform(UInt32(listOfCards.count))
        let cardPicked = listOfCards.remove(at: Int(randCardIndex))
        
        return cardPicked
    }
}
