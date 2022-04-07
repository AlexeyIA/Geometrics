//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class Logic {
    
    let placements = PlacementsLogic()
    
    let gameplay = GameplayLogic()
    
    func play(inLevel lvl: Level) {
        
        switch gameplay.getState() {
        
        case .setFigureData:
            
            SetFigureDataLogic.setFigureData(inLevel: lvl)
            
        case .closeFigures:
            print("Play for state closeFigures")
            
        default:
            break
        }
    }
}

