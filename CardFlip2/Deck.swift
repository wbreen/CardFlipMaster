//
//  Deck.swift
//  CardFlip2
//
//  Created by William Breen on 9/21/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import Foundation
import UIKit

class Card {
    
    //properties (not instance variables)
    var value: String
    var suit: String
    var isShowing: Bool
    
    var frontImage: UIImage
    var backImage = #imageLiteral(resourceName: "back")
    var text: String
    
    //init=initializer, you have to initialize all the properties
    //needed init so we could get a value and a suit from the card
    init(_ value: String, _ suit: String){
        self.value = value
        self.suit = suit
        self.isShowing = false
        self.frontImage = UIImage(named: "\(value)_\(suit)")!
        self.text = "\(value) of \(suit)"
    }
    
    func getImage() -> UIImage {
        if isShowing{// if front is showing, return the front
            return frontImage
        }
        else{       // if back is showing, return back
            return backImage
        }
    }
}

let values = ["two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king", "ace"]

//add the hearts and spades to make the full deck of cards (after I add the extra card pictures)
let suits = ["clubs", "diamonds", "hearts", "spades"]

class Deck {
    
    //makes sure the card and the inUse are the same values, so if you are using it, you don't use it again
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
    //ramdomly draws a card from the deck -- unique card for each 
    func drawRandomCard() -> Card {
        var which = 0
        repeat{
            which = Int(arc4random_uniform(UInt32(deck.count)))
        } while inUse[which]
        
        inUse[which] = true
        return deck[which]
    }
    
}
