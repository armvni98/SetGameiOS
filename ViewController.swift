//
//  ViewController.swift
//  SetGame
//
//  Created by Ashadur Omith on 9/28/20.
//  Copyright © 2020 Ashadur Omith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet  var SetCardButtons: [UIButton]!
    @IBOutlet weak var SetDeal3: UIButton!
    
    
    let setGame = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for buttonIndex in SetCardButtons.indices {
            let button = SetCardButtons[buttonIndex]
            button.deselect()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
            button.layer.cornerRadius = 10
            button.isHidden = true
        }
        
        updateViewFromModel()
    }
    
    
    
    @IBAction func selectCard(_ sender: UIButton) {
        if var cardIndex = SetCardButtons.index(of: sender) {
            
            
            setGame.select(card: setGame.cardsInGame[cardIndex])
            setGame.assignCard(at: cardIndex)
            
            updateSetLabelAndScore()
            
            updateViewFromModel()
            
            
        }
    }
    
    func updateSetLabelAndScore() {
        if setGame.isSet() {
            matchOrMismatch.textColor = UIColor.green
            matchOrMismatch.text = "IS A SET ✅"
            setGame.score += 6
        }
        else if (!setGame.isSet()) && (setGame.selectedCards.count == 3){
            matchOrMismatch.textColor = UIColor.red
            matchOrMismatch.text = "NOT A SET ❌"
            setGame.score -= 3
        }
        else{
            matchOrMismatch.text = ""
        }
        scoreCount.text = ("Score: \(setGame.score)")
    }
    
    @IBOutlet weak var matchOrMismatch: UILabel!
    @IBOutlet weak var scoreCount: UILabel!
    
    
    
    
    @IBAction func newGame() {
        setGame.score = 0
        setGame.newGame()
        updateViewFromModel()
        viewDidLoad()
        DBindex = 0
        SetDeal3.isHidden = false
        updateSetLabelAndScore()
    }
    
    var DBindex = 0
    @IBAction func deal3() {
        
        setGame.deal3()
        updateViewFromModel()
        
        DBindex+=1
        
        if DBindex == 4{
            SetDeal3.isHidden = true
        }
        
    }
    
    
    
    
    private func updateViewFromModel() {
        var cardButtonIndex = 0
        for card in setGame.cardsInGame {
            
            let button = SetCardButtons[cardButtonIndex]
            setButton.renderCard(cardToRender: card,
                                 onButton: button,
                                 selectButton: setGame.cardIsSelected(card: card),
                                 isSet: setGame.isSet())
            cardButtonIndex += 1
            
        }
        
    }
    
    
    
    
}
