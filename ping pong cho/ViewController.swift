//
//  ViewController.swift
//  ping pong cho
//
//  Created by Felipe Alejandro Osorio on 11/7/15.
//  Copyright © 2015 Felipe Osorio. All rights reserved.
//

import UIKit
//import QuartzCore

class ViewController: UIViewController {
    
    var playerOneTally = 0
    var playerTwoTally = 0
    var playerOneGames = 0
    var playerTwoGames = 0
    var pointsToWin = 11
    var overallProgress = Float(0)

    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerOneGame: UIButton!
    @IBOutlet weak var playerOneCho: UIStepper!
    @IBOutlet weak var playerOneGameDisplay: UILabel!
    
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var playerTwoGame: UIButton!
    @IBOutlet weak var playerTwoCho: UIStepper!
    @IBOutlet weak var playerTwoGameDisplay: UILabel!
    
    @IBOutlet weak var gameProgressLabel: UILabel!
    @IBOutlet weak var gameProgressBar: UIProgressView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var oldSchool: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
//        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
//        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        gameProgressBar.setProgress(0, animated: true)
        oldSchool.setOn(false, animated: true)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
//    override func shouldAutorotate() -> Bool {
//        return true
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("OOPS. MEMORY WARNING!")
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneGamePress(sender: UIButton!) { //mistake
        if playerOneGames >= 1 {
            --playerOneGames //manually decrement player 1 games
            playerOneGameDisplay.text = playerOneGames.description
        }
        print(playerOneGames)
    }

    @IBAction func twoGamePress(sender: UIButton!) { //mistakenly won game
        if playerTwoGames >= 1 {
            --playerTwoGames
            playerTwoGameDisplay.text = playerTwoGames.description
        }
        print(playerTwoGames)
    }
    
    @IBAction func oneClicker(sender: UIStepper) { //increment score
        winnerLabel.text = ""
        winnerLabel.layer.borderWidth = 0.0
        playerOneTally = Int(sender.value)
        print("Player 1 has \(playerOneTally) points")
        self.playerOneScore.text = playerOneTally.description
        oldSchoolFun()
        if (playerOneTally >= pointsToWin) && (playerOneTally - playerTwoTally >= 2) { //11 = winPoints
            playerOneGames++ // player one wins a game
            self.playerOneGameDisplay.text = playerOneGames.description
            triggerVictory() // player 1!
            print("Player 1 takes Game \(playerOneGames + playerTwoGames)")
        }
        updateMatchProgress()
    }
    
    @IBAction func twoClicker(sender: UIStepper) { //increment score
        winnerLabel.text = ""
        winnerLabel.layer.borderWidth = 0.0
        playerTwoTally = Int(sender.value)
        print("Player 2 has \(playerTwoTally) points")
        oldSchoolFun()
        self.playerTwoScore.text = playerTwoTally.description
        if (playerTwoTally >= pointsToWin) && (playerTwoTally - playerOneTally >= 2) {
            playerTwoGames++
            self.playerTwoGameDisplay.text = playerTwoGames.description
            triggerVictory() // player 2!
            print("Player 2 takes Game \(playerOneGames + playerTwoGames)")
        }
        updateMatchProgress()
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
        let gamesPlayed = Int(playerOneGames + playerTwoGames)
        if playerOneGames >= 3 || playerTwoGames >= 3 || gamesPlayed >= 5 { // best of 5 games assumed default
            gameProgressBar.setProgress(1.00, animated: true)
            return()
        }
        overallProgress = Float(gamesPlayed) * 0.20
        let currentProgress = Float(playerOneTally + playerTwoTally)/100.00 * Float(pointsToWin/11) + Float(overallProgress)
        gameProgressBar.setProgress(currentProgress, animated: false)
        gameProgressLabel.text = ("\(currentProgress*100)%")
        //print("Match progress at \(currentProgress*100)%")
    }
    func oldSchoolFun() {
        if oldSchool.on {
            pointsToWin = 21
        }
        else {
            pointsToWin = 11
        }
    }
    
    func triggerVictory() {
        winnerLabel.text = ("CHO!")
        winnerLabel.layer.borderWidth = 4.0
        winnerLabel.layer.borderColor = UIColor.redColor().CGColor
        resetPointScores()
    }
    
    func playerOneScored() {
        winnerLabel.text = ""
        winnerLabel.layer.borderWidth = 0.0
        playerOneTally += 1
        print("Player 1 has \(playerOneTally) points")
        self.playerOneScore.text = playerOneTally.description
        oldSchoolFun()
        if (playerOneTally >= pointsToWin) && (playerOneTally - playerTwoTally >= 2) { //11 = winPoints
            playerOneGames++ // player one wins a game
            self.playerOneGameDisplay.text = playerOneGames.description
            triggerVictory() // player 1!
            print("Player 1 takes Game \(playerOneGames + playerTwoGames)")
        }
        updateMatchProgress()

    }
    
    func playerTwoScored() {
        winnerLabel.text = ""
        winnerLabel.layer.borderWidth = 0.0
        playerTwoTally += 1
        print("Player 2 has \(playerTwoTally) points")
        oldSchoolFun()
        self.playerTwoScore.text = playerTwoTally.description
        if (playerTwoTally >= pointsToWin) && (playerTwoTally - playerOneTally >= 2) {
            playerTwoGames++
            self.playerTwoGameDisplay.text = playerTwoGames.description
            triggerVictory() // player 2!
            print("Player 2 takes Game \(playerOneGames + playerTwoGames)")
        }
        updateMatchProgress()
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                playerTwoScored()
            case UISwipeGestureRecognizerDirection.Down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                playerOneScored()
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}




