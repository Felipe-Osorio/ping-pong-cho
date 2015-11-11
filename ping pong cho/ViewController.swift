//
//  ViewController.swift
//  ping pong cho
//
//  Created by Felipe Alejandro Osorio on 11/7/15.
//  Copyright © 2015 Felipe Osorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerOneTally = 0
    var playerTwoTally = 0
    var playerOneGames = 0
    var playerTwoGames = 0

    @IBOutlet weak var playerOneScore: UITextField!
    @IBOutlet weak var playerOneGame: UIButton!
    @IBOutlet weak var playerOneCho: UIStepper!
    
    @IBOutlet weak var playerTwoScore: UITextField!
    @IBOutlet weak var playerTwoGame: UIButton!
    @IBOutlet weak var playerTwoCho: UIStepper!
    
    
    @IBOutlet weak var gameProgressBar: UIProgressView!
    @IBOutlet weak var oldSchoolOn: UISwitch!
    //@IBOutlet weak var pingPongLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("OOPS. MEMORY WARNING!")
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneGamePress(sender: UIButton!) { //won game
        ++playerOneGames //manually increment player 1 games
        print(playerOneGames)
    }

    @IBAction func twoGamePress(sender: UIButton!) { //won game
        ++playerTwoGames
        print(playerTwoGames)
    }
    @IBAction func oneClicker(sender: UIStepper) { //increment score
        playerOneTally = Int(sender.value)
        self.playerOneScore.text = playerOneTally.description
        if (playerOneTally >= 11) && (playerOneTally - playerTwoTally >= 2) {
            playerOneGames++ // player one wins a game
            playerOneTally = 0 // reset the counter to new game
            self.playerOneScore.text = playerOneTally.description
            print("inside conditional stepper 1")
        }
        
    }
    @IBAction func twoClicker(sender: UIStepper) { //increment score
        self.playerTwoScore.text = Int(sender.value).description
    }
}




