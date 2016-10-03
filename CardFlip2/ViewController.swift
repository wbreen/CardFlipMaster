//
//  ViewController.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/14/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageAreaLabel: UILabel!
    @IBOutlet weak var Card1_1: UIImageView!
    @IBOutlet weak var Card1_2: UIImageView!
    @IBOutlet weak var Card1_3: UIImageView!
    @IBOutlet weak var Card1_4: UIImageView!
    @IBOutlet weak var Card2_1: UIImageView!
    @IBOutlet weak var Card2_2: UIImageView!
    @IBOutlet weak var Card2_3: UIImageView!
    @IBOutlet weak var Card2_4: UIImageView!
    @IBOutlet weak var Card3_1: UIImageView!
    @IBOutlet weak var Card3_2: UIImageView!
    @IBOutlet weak var Card3_3: UIImageView!
    @IBOutlet weak var Card3_4: UIImageView!
    @IBOutlet weak var Card4_1: UIImageView!
    @IBOutlet weak var Card4_2: UIImageView!
    @IBOutlet weak var Card4_3: UIImageView!
    @IBOutlet weak var Card4_4: UIImageView!
    
    // dont need deck any more
    //var deck = Deck()
    
    //create the model
    var matchGame = MatchGame()
    
    //creating an array of the imageViews
    var imageViews: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hook up array in this function because the images may not exist yet
        imageViews = [Card1_1, Card1_2, Card1_3, Card1_4,
                      Card2_1, Card2_2, Card2_3, Card2_4,
                      Card3_1, Card3_2, Card3_3, Card3_4,
                      Card4_1, Card4_2, Card4_3, Card4_4]
        //gives entry label
        messageAreaLabel.text = matchGame.message
    }
    
    
    @IBAction func cardTap(_ sender: UITapGestureRecognizer) {
        
        let card = sender.view! as! UIImageView
        
        var which = -1
        
        //which card was tapped?
        for i in 0..<imageViews.count{
            if imageViews[i] == card {
                which = i
            }
        }
        if (which > -1){
            matchGame.flipCardUp(which)
            
            for i in 0..<imageViews.count {
                imageViews[i].image = matchGame.getImage(i)
            }
            
            flipsLabel.text = "Flips: \(matchGame.flips)"
            scoreLabel.text = "Score: \(matchGame.score)"
            messageAreaLabel.text = matchGame.message
        }
    }
}
