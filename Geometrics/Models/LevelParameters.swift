//
//  LevelEasy.swift
//  Geometrics
//
//  Created by Alexey A on 02.02.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

protocol AbstractParams {
    
    func getCurrentLevel() -> LevelDifficulty
    func getPossibleForms() -> [Forms]
    func getPossibleColors() -> [Colors]
    func getFieldSize() -> FieldSizes
}


class LevelEasyParams: AbstractParams {
    
    func getCurrentLevel() -> LevelDifficulty {
        return .easy
    }
  
    func getPossibleForms() -> [Forms] {
        return [Forms.triangle, Forms.square]
    }
    
    func getPossibleColors() -> [Colors] {
        return [Colors.blue, Colors.green]
    }
    
    func getFieldSize() -> FieldSizes {
        return FieldSizes.fourOnfour
    }
}


class LevelNormalParams: AbstractParams {
   
    func getCurrentLevel() -> LevelDifficulty {
        return .normal
    }
    
    func getPossibleForms() -> [Forms] {
        return [Forms.triangle, Forms.square, Forms.circle]
    }
    
    func getPossibleColors() -> [Colors] {
        return [Colors.blue, Colors.green, Colors.lightGreen]
    }
    
    func getFieldSize() -> FieldSizes {
        return FieldSizes.fourOnfive
    }
}

class LevelNoneParams: AbstractParams {
   
    func getCurrentLevel() -> LevelDifficulty {
        return .none
    }
    
    func getPossibleForms() -> [Forms] {
        return [Forms.none]
    }
    
    func getPossibleColors() -> [Colors] {
        return [Colors.none]
    }
    
    func getFieldSize() -> FieldSizes {
        return FieldSizes.none
    }
}


enum LevelDifficulty {
    case none, easy, normal, hard
}

enum FieldSizes {
    case none, fourOnfour, fourOnfive
}

enum FigureSizes {
    case none, small, normal, large
}

enum Forms: CaseIterable {
    case none, circle, square, triangle
}

enum Colors: CaseIterable {
    case none, blue, green, lightGreen
}



