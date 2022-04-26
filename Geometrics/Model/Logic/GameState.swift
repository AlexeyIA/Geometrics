//
//  GameplayLogic.swift
//  Geometrics
//
//  Created by Alexey A on 07.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

class GameState {
    
    private var state = State.start
    
    func setState(to state: State) {
        self.state = state
    }
    
    func getState() -> State {
        return state
    }
    
}

enum State {
    case start
    case setFigureData
    case setFigureViews
    case closeFigures
}
