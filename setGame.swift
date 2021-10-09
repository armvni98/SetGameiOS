//
//  SetGame.swift
//  SetGame
//
//  Created by Ashadur Omith on 9/30/20.
//  Copyright © 2020 Ashadur Omith. All rights reserved.
//

import Foundation

class SetGame{
    
    var score = 0
    
    var availableDeck = [SetCard]()
    var cardsInGame = [SetCard]()
    var selectedCards = [SetCard]()
    
    init() {
        newGame()
    }
    
    func newGame() {
        availableDeck.removeAll()
        cardsInGame.removeAll()
        selectedCards.removeAll()
        
        createDeck()
        addCards(numberOfCardsToSelect: 12)
        
    }
    
    func deal3 () {
        addCards(numberOfCardsToSelect: 3)
        
    }
    
    private func createDeck() {
        for color in SetCard.Colors.all {               // Initializing our deck
            for shape in SetCard.Shapes.all {
                for shade in SetCard.Shades.all {
                    for count in SetCard.Count.all{
                        availableDeck += [SetCard(shape: shape, shade: shade, color: color, count: count)]
                        
                        availableDeck.shuffle()         //shuffle the deck
                        
                    }
                }
            }
        }
        
    }
    
    
    
    private func addCard() {
        let selectedCard = availableDeck.remove(at: 0)   //removing card from deck assigning to selectedCard
        cardsInGame.append(selectedCard)
        
    }
    
    
    func addCards(numberOfCardsToSelect numberOfCards: Int) {
        assert(numberOfCards <= availableDeck.count)
        for _ in 0..<numberOfCards {
            addCard()
        }
    }
    
    func cardIsSelected(card: SetCard) -> Bool {
        return selectedCards.firstIndex(of: card) != nil
    }
    
    
    
    func isSet() -> Bool {
        
        if selectedCards.count != 3 {
            
            return false
            
        }
        
        if selectedCards[0].color == selectedCards[1].color {
            if selectedCards[0].color != selectedCards[2].color {
                return false
            }
        } else if selectedCards[1].color == selectedCards[2].color {
            return false
        } else if (selectedCards[0].color == selectedCards[2].color) {
            return false
        }
        
        if selectedCards[0].shape == selectedCards[1].shape {
            if selectedCards[0].shape != selectedCards[2].shape {
                return false
            }
        } else if selectedCards[1].shape == selectedCards[2].shape {
            return false
        } else if (selectedCards[0].shape == selectedCards[2].shape) {
            return false
        }
        
        if selectedCards[0].shade == selectedCards[1].shade {
            if selectedCards[0].shade != selectedCards[2].shade {
                return false
            }
        } else if selectedCards[1].shade == selectedCards[2].shade {
            return false
        } else if (selectedCards[0].shade == selectedCards[2].shade) {
            return false
        }
        
        
        if selectedCards[0].count == selectedCards[1].count {
            if selectedCards[0].count != selectedCards[2].count {
                return false
            }
        } else if selectedCards[1].count == selectedCards[2].count {
            return false
        } else if (selectedCards[0].count == selectedCards[2].count) {
            return false
        }
        
        
        
        
        
        
        
        return true
    }
    
    
    
    func select(card: SetCard) {
        
        if selectedCards.count == 3 {
            
            selectedCards = [SetCard]()
            
            
        }
        
        if let cardToSelect = selectedCards.index(of: card) {
            
            selectedCards.remove(at: cardToSelect)
            
            
        } else {
            
            selectedCards.append(card)
        }
        
        
        
    }
    
    
    var arr = [Int]()
    func assignCard(at cardIndex: Int) {
        
        if arr.contains(cardIndex){
            
            if arr[0] == cardIndex{
                arr.remove(at: 0)
            }
            else{
                arr.remove(at: 1)
                
            }
            
        }
            
        else{
            
            if availableDeck.count != 0 {
                
                arr.append(cardIndex)
                
                
                
                
                if isSet(){
                    for i in 0 ..< 3{
                        cardsInGame[ arr[i] ] = availableDeck.remove(at: 0)
                    }
                    
                    arr.removeAll()
                    
                }
                    
                else if arr.count == 3{
                    arr.removeAll()
                }
            }
            
            
        }
    }
    
    
}
