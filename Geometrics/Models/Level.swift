//
//  LevelParams.swift
//  Geometrics
//
//  Created by Alexey A on 01.02.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation


class Level {
    
    private var levelParameters = LevelNoneParams() as AbstractParams

    func setDifficulty(difficulty: LevelDifficulty) {
        
        switch difficulty {
        case .easy:
            levelParameters = LevelEasyParams()
        case .normal:
            levelParameters = LevelNormalParams()
        default:
            break
        }
    }
}

extension Level: AbstractParams {
    
    func getCurrentLevel() -> LevelDifficulty {
        levelParameters.getCurrentLevel()
    }
    
    func getPossibleForms() -> [Forms] {
        levelParameters.getPossibleForms()
    }
    
    func getPossibleColors() -> [Colors] {
        levelParameters.getPossibleColors()
    }
    
    func getFieldSize() -> FieldSizes {
        levelParameters.getFieldSize()
    }
}



