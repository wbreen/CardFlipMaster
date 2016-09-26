//
//  Deck.swift
//  CardFlip2
//
//  Created by William Breen on 9/21/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

class Card {
    
    var value: String
    var suit: String
    var isShowing: Bool
    
    var frontImage: UIImage
    var backImage = #imageLiteral(resourceName: "back")
    var text: String
    
    init(_ value: String, _ suit: String){
        self.value = value
        self.suit = suit
        self.isShowing = false
        self.frontImage = UIImage(named: "\(value)_\(suit)")!
        self.text = "\(value) of \(suit)"
    }
}

let values = ["two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king", "ace"]

let suits = ["clubs", "diamonds"]

class Deck {
    
    var deck: [Card] = []
    var inUse: [Bool] = []
    
    init(){
        for suit in suits {
            for value in values{
                deck.append(Card(value, suit))
                inUse.append(false)
            }
        }
    }
    
    func drawRandomCard() -> Card {
        var which = 0
        repeat{
            which = Int(arc4random_uniform(UInt32(deck.count)))
        } while inUse[which]
        
        inUse[which] = true
        return deck[which]
    }
    
}
