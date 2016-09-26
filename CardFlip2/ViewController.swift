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
    
    var deck = Deck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cardTap(_ sender: UITapGestureRecognizer) {
        
        let card = sender.view! as! UIImageView
        
        if card.image == #imageLiteral(resourceName: "back") {
            card.image = #imageLiteral(resourceName: "ace_clubs")
        } else {
            card.image = #imageLiteral(resourceName: "back")
        }
    }
}
