//
//  ViewController.swift
//  TicTacToe
//
//  Created by Eric H on 16/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    var activeGame = true
    
    var activePlayer = 1
    //1 is Baby2
    
    var gameState = [0,0,0,0,0,0,0,0,0] //0-empty, 1-baby, 2-messy
    
    
    
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        
        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x - 500, y: self.winnerLabel.center.y)
        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x - 500, y: self.playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            
            
            gameState[activePosition] = activePlayer
            
            
            if  activePlayer == 1{
                
                sender.setImage(UIImage(named: "Baby2.gif"), for: [])
                activePlayer = 2
            }else{
                
                
                sender.setImage(UIImage(named: "MessyBaby3.gif"), for: [])
                activePlayer = 1
                
            }
            
            for combination in winningCombinations{
                if  gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    //We have a winner
                    
                    activeGame = false
                    
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1{
                        winnerLabel.text = "Baby2 Winner"
                    }else{
                        
                        winnerLabel.text = "MessyBaby Winner"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                    
                    
                }
            }
        }
        
     
        
    }

    @IBAction func playAgainButtonTapped(_ sender: AnyObject) {
        
        activeGame = true
        
         activePlayer = 1
        //1 is Baby2
        
         gameState = [0,0,0,0,0,0,0,0,0] //0-empty, 1-baby, 2-messy
        
        
        for i in 1..<10{
            
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        
        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x - 500, y: self.winnerLabel.center.y)
        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x - 500, y: self.playAgainButton.center.y)
    }

}
























