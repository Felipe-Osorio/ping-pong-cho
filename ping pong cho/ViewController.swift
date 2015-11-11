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
    @IBOutlet weak var playerOneGameDisplay: UITextField!
    
    @IBOutlet weak var playerTwoScore: UITextField!
    @IBOutlet weak var playerTwoGame: UIButton!
    @IBOutlet weak var playerTwoCho: UIStepper!
    @IBOutlet weak var playerTwoGameDisplay: UITextField!
    
    @IBOutlet weak var gameProgressLabel: UILabel!
    @IBOutlet weak var gameProgressBar: UIProgressView!
    
    @IBOutlet weak var oldSchoolOn: UISwitch!
    //@IBOutlet weak var pingPongLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameProgressBar.setProgress(0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //gameProgressBar.valueForKey(<#T##key: String##String#>) += 0.5
        print("OOPS. MEMORY WARNING!")
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneGamePress(sender: UIButton!) { //won game
        ++playerOneGames //manually increment player 1 games
        playerOneGameDisplay.text = playerOneGames.description
        print(playerOneGames)
    }

    @IBAction func twoGamePress(sender: UIButton!) { //won game
        ++playerTwoGames
        print(playerTwoGames)
        playerTwoGameDisplay.text = playerTwoGames.description
    }
    @IBAction func oneClicker(sender: UIStepper) { //increment score
        playerOneTally = Int(sender.value)
        print("Player 1 has \(playerOneTally) points")
        self.playerOneScore.text = playerOneTally.description
        if (playerOneTally >= 11) && (playerOneTally - playerTwoTally >= 2) { //11 = winPoints
            playerOneGames++ // player one wins a game
            self.playerOneGameDisplay.text = playerOneGames.description
            resetPointScores()
            print("Player 1 takes Game \(playerOneGames + playerTwoGames)")
        }
        
    }
    @IBAction func twoClicker(sender: UIStepper) { //increment score
        playerTwoTally = Int(sender.value)
        print("Player 2 has \(playerTwoTally) points")
        self.playerTwoScore.text = playerTwoTally.description
        if (playerTwoTally >= 11) && (playerTwoTally - playerOneTally >= 2) {
            playerTwoGames++
            self.playerTwoGameDisplay.text = playerTwoGames.description
            resetPointScores()
            print("Player 2 takes Game \(playerOneGames + playerTwoGames)")
        }
    }
    func resetPointScores() {
        playerOneTally = 0 // reset the counter to new game
        playerOneCho.value = 0
        playerTwoTally = 0
        playerTwoCho.value = 0
        self.playerOneScore.text = playerOneTally.description
        self.playerTwoScore.text = playerTwoTally.description
    }
    func updateMatchProgress() {
        //self.gameProgressBar.description = "hi"
    }
    
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            gameProgressBar.setProgress(fractionalProgress, animated: animated)
            gameProgressLabel.text = ("\(counter)%")
        }
    }

}




