//
//  ViewController.swift
//  ping pong cho
//
//  Created by Felipe Alejandro Osorio on 11/7/15.
//  Copyright © 2015 Felipe Osorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerOneScore = 0
    var playerTwoScore = 0
    var playerOneGames = 0
    var playerTwoGames = 0

    @IBOutlet weak var playerOneName: UITextField!
    @IBOutlet weak var playerOneGame: UIButton!
    @IBOutlet weak var playerOneCho: UIStepper!
    
    @IBOutlet weak var playerTwoName: UITextField!
    @IBOutlet weak var playerTwoGame: UIButton!
    @IBOutlet weak var playerTwoCho: UIStepper!
    
    
    @IBOutlet weak var gameProgressBar: UIProgressView!
    @IBOutlet weak var oldSchoolOn: UISwitch!
    @IBOutlet weak var pingPongLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneGamePress(sender: UIButton) {
        playerOneScore = playerOneScore + 1
        print(playerOneScore)
    }
    @IBAction func twoGamePress(sender: UIButton) {
    }
    
}

