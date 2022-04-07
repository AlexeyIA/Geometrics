//
//  GameplayLogic.swift
//  Geometrics
//
//  Created by Alexey A on 07.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

class GameplayLogic {
    
    private var gameState = GameState.start
    
    func setState(to state: GameState) {
        gameState = state
    }
    
    func getState() -> GameState {
        return gameState
    }
    
}

enum GameState {
    case start
    case setFigureData
    case showFigures
    case closeFigures
    case inPlay
    case clearFigureData
    case gameover
}
