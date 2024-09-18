//
//  GameViewModel.swift
//  SpadesScoreKeeper
//
//  Created by Rickey Johnson on 3/29/24.
//

import Foundation

class GameViewModel: ObservableObject {
    var teamA = TeamModel(name: "team A", score: 0, bags: 0)
    var teamB = TeamModel(name: "team B", score: 0, bags: 0)
    
    func calculatePoints(bid: Int, tricksWon: Int) -> Int {
        if (tricksWon >= bid) {
            return bid * 10 + (tricksWon - bid)
        }
        
        return -bid * 10
    }
    
    
}
